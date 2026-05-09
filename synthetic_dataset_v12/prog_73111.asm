; DESCRIPTION: Composite: Creates a orange rectangular region at (25, 0) spanning 103 by 12 pixels then Places a magenta circle of radius 16 at center (288, 43).
; PLAN: r0=25(x), r1=0(y), r2=103(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=43(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 0
LDI r2, 103
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 43
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
