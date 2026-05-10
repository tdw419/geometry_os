; DESCRIPTION: Renders a orange circular shape at (398, 90) with radius 29.
; PLAN: r0=398(x), r1=90(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 90
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
