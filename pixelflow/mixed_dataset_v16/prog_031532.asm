; DESCRIPTION: Composite: Draws a cyan circle centered at (209, 86) with radius 59 then Places a yellow line segment connecting (209, 75) to (378, 81) then Places a black 27x39 rectangle at position (237, 191).
; PLAN: r0=209(x), r1=86(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=75(y1), r7=378(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=191(y), r12=27(width), r13=39(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 86
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 75
LDI r7, 378
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 191
LDI r12, 27
LDI r13, 39
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
