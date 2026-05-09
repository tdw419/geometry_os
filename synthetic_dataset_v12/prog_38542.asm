; DESCRIPTION: Composite: Places a black dot at position (339, 152) then Renders a red box of size 22x60 starting at (194, 196) then Draws a magenta circle centered at (216, 87) with radius 67.
; PLAN: r0=339(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=196(y), r7=22(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=87(y), r12=67(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 194
LDI r6, 196
LDI r7, 22
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 87
LDI r12, 67
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
