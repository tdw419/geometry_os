; DESCRIPTION: Renders a orange line between points (310, 151) and (231, 153).
; PLAN: r0=310(x1), r1=151(y1), r2=231(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 151
LDI r2, 231
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
