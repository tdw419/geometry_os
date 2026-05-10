; DESCRIPTION: Renders a white rectangular region spanning 104 by 12 at (397, 158).
; PLAN: r0=397(x), r1=158(y), r2=104(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 158
LDI r2, 104
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
