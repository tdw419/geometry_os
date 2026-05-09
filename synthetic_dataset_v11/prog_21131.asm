; DESCRIPTION: Renders a orange line between points (122, 203) and (144, 143).
; PLAN: r0=122(x1), r1=203(y1), r2=144(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 203
LDI r2, 144
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
