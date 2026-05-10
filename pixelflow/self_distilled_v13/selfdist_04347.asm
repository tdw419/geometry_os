; DESCRIPTION: Renders a orange circular shape at (327, 110) with radius 50.
; PLAN: r0=327(x), r1=110(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 110
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
