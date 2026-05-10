; DESCRIPTION: Composite: Places a blue dot at position (168, 123) then Renders a red box of size 19x60 starting at (294, 122) then Places a magenta circle of radius 36 at center (154, 66).
; PLAN: r0=168(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=122(y), r7=19(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=66(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 122
LDI r7, 19
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 66
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
