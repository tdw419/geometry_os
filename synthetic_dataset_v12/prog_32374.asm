; DESCRIPTION: Composite: Creates a blue circular shape at (440, 92) with radius 26 then Renders a purple box of size 20x64 starting at (476, 95).
; PLAN: r0=440(x), r1=92(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=95(y), r7=20(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 92
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 95
LDI r7, 20
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
