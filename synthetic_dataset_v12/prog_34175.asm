; DESCRIPTION: Composite: Places a magenta 52x32 rectangle at position (222, 74) then Draws a magenta circle centered at (179, 120) with radius 79.
; PLAN: r0=222(x), r1=74(y), r2=52(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=120(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 74
LDI r2, 52
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 120
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
