; DESCRIPTION: Renders a black line between points (43, 210) and (105, 68).
; PLAN: r0=43(x1), r1=210(y1), r2=105(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 210
LDI r2, 105
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
