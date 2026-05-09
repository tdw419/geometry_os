; DESCRIPTION: Creates a magenta circular shape at (352, 116) with radius 65.
; PLAN: r0=352(x), r1=116(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 116
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
