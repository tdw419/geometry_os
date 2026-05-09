; DESCRIPTION: Renders a cyan line between points (233, 206) and (223, 94).
; PLAN: r0=233(x1), r1=206(y1), r2=223(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 206
LDI r2, 223
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
