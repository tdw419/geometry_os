; DESCRIPTION: Renders a white line between points (6, 14) and (73, 198).
; PLAN: r0=6(x1), r1=14(y1), r2=73(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 14
LDI r2, 73
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
