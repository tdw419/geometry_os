; DESCRIPTION: Renders a orange line between points (190, 209) and (84, 103).
; PLAN: r0=190(x1), r1=209(y1), r2=84(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 209
LDI r2, 84
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
