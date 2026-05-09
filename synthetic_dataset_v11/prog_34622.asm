; DESCRIPTION: Renders a orange line between points (144, 45) and (107, 183).
; PLAN: r0=144(x1), r1=45(y1), r2=107(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 45
LDI r2, 107
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
