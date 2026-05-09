; DESCRIPTION: Composite: Creates a green rectangular region at (42, 55) spanning 75 by 67 pixels then Places a green circle of radius 40 at center (101, 50).
; PLAN: r0=42(x), r1=55(y), r2=75(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=50(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 55
LDI r2, 75
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 50
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
