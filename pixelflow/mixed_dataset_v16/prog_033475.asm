; DESCRIPTION: Renders a cyan line between points (61, 94) and (435, 171).
; PLAN: r0=61(x1), r1=94(y1), r2=435(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 435
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
