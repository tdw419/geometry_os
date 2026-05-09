; DESCRIPTION: Draws a orange circle centered at (295, 162) with radius 58.
; PLAN: r0=295(x), r1=162(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 162
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
