; DESCRIPTION: Renders a orange line between points (254, 174) and (209, 235).
; PLAN: r0=254(x1), r1=174(y1), r2=209(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 174
LDI r2, 209
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
