; DESCRIPTION: Draws a orange circle centered at (470, 112) with radius 40.
; PLAN: r0=470(x), r1=112(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 112
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
