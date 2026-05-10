; DESCRIPTION: Composite: Renders a blue box of size 19x80 starting at (422, 86) then Places a blue circle of radius 15 at center (166, 205).
; PLAN: r0=422(x), r1=86(y), r2=19(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=205(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 86
LDI r2, 19
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 205
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
