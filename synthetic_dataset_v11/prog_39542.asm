; DESCRIPTION: Composite: . Then Places a white 43x79 rectangle at position (167, 109). Then Draws a purple circle centered at (131, 96) with radius 31.
; PLAN: r0=167(x), r1=109(y), r2=43(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x), r1=96(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 43x79 rectangle at position (167, 109).
; PLAN: r0=167(x), r1=109(y), r2=43(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 109
LDI r2, 43
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (131, 96) with radius 31.
; PLAN: r0=131(x), r1=96(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 96
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
