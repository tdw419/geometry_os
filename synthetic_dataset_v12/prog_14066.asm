; DESCRIPTION: Draws a orange circle centered at (169, 133) with radius 46.
; PLAN: r0=169(x), r1=133(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 133
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
