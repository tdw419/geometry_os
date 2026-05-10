; DESCRIPTION: Renders a magenta rectangular region spanning 104 by 35 at (49, 128).
; PLAN: r0=49(x), r1=128(y), r2=104(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 128
LDI r2, 104
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
