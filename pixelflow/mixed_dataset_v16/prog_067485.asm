; DESCRIPTION: Composite: Renders a blue box of size 42x11 starting at (188, 152) then Draws a cyan circle centered at (209, 21) with radius 20.
; PLAN: r0=188(x), r1=152(y), r2=42(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=21(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 152
LDI r2, 42
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 21
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
