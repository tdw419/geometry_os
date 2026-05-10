; DESCRIPTION: Composite: Places a cyan 58x54 rectangle at position (220, 173) then Sets a single blue pixel at (63, 154) then Places a black circle of radius 11 at center (317, 225).
; PLAN: r0=220(x), r1=173(y), r2=58(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=154(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=225(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 173
LDI r2, 58
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 154
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 317
LDI r11, 225
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
