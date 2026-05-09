; DESCRIPTION: Creates a orange circular shape at (213, 179) with radius 50.
; PLAN: r0=213(x), r1=179(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 179
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
