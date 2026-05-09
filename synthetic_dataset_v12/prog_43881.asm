; DESCRIPTION: Creates a orange circular shape at (404, 128) with radius 37.
; PLAN: r0=404(x), r1=128(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 128
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
