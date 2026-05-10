; DESCRIPTION: Renders a orange circular shape at (187, 4) with radius 37.
; PLAN: r0=187(x), r1=4(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 4
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
