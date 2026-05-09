; DESCRIPTION: Renders a orange line between points (105, 156) and (213, 103).
; PLAN: r0=105(x1), r1=156(y1), r2=213(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 156
LDI r2, 213
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
