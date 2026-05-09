; DESCRIPTION: Composite: Creates a blue rectangular region at (60, 27) spanning 74 by 66 pixels then Places a magenta circle of radius 54 at center (329, 100).
; PLAN: r0=60(x), r1=27(y), r2=74(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=100(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 27
LDI r2, 74
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 100
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
