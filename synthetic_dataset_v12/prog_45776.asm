; DESCRIPTION: Composite: Renders a blue box of size 55x84 starting at (392, 172) then Places a green circle of radius 55 at center (69, 56).
; PLAN: r0=392(x), r1=172(y), r2=55(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=56(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 172
LDI r2, 55
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 56
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
