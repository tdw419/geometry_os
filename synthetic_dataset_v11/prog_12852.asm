; DESCRIPTION: Renders a orange line between points (64, 209) and (105, 65).
; PLAN: r0=64(x1), r1=209(y1), r2=105(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 209
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
