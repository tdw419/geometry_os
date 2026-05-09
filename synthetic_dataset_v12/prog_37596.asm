; DESCRIPTION: Renders a orange line between points (197, 203) and (152, 7).
; PLAN: r0=197(x1), r1=203(y1), r2=152(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 203
LDI r2, 152
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
