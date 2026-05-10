; DESCRIPTION: Renders a cyan line between points (248, 113) and (61, 40).
; PLAN: r0=248(x1), r1=113(y1), r2=61(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 113
LDI r2, 61
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
