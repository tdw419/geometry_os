; DESCRIPTION: Creates a magenta circular shape at (173, 153) with radius 55.
; PLAN: r0=173(x), r1=153(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 153
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
