; DESCRIPTION: Composite: Renders a blue disk with center (409, 212) and radius 38 then Places a blue dot at position (364, 191) then Places a cyan 95x24 rectangle at position (254, 86).
; PLAN: r0=409(x), r1=212(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=191(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=86(y), r12=95(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 212
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 191
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 86
LDI r12, 95
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
