; DESCRIPTION: Composite: Places a green 28x97 rectangle at position (353, 62) then Sets a single blue pixel at (243, 188) then Renders a blue disk with center (111, 201) and radius 51.
; PLAN: r0=353(x), r1=62(y), r2=28(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=188(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=201(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 62
LDI r2, 28
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 188
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 201
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
