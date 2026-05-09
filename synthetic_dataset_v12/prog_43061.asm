; DESCRIPTION: Renders a orange line between points (329, 251) and (408, 244).
; PLAN: r0=329(x1), r1=251(y1), r2=408(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 251
LDI r2, 408
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
