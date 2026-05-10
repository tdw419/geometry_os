; DESCRIPTION: Renders a orange circular shape at (162, 90) with radius 59.
; PLAN: r0=162(x), r1=90(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 90
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
