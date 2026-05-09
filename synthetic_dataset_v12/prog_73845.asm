; DESCRIPTION: Composite: Places a blue circle of radius 42 at center (240, 203) then Renders a magenta box of size 74x73 starting at (285, 35).
; PLAN: r0=240(x), r1=203(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=35(y), r7=74(width), r8=73(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 203
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 35
LDI r7, 74
LDI r8, 73
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
