; DESCRIPTION: Composite: Draws a cyan rectangle at (405, 77) with width 63 and height 88 then Places a purple circle of radius 43 at center (263, 91) then Renders a green line between points (18, 15) and (295, 207).
; PLAN: r0=405(x), r1=77(y), r2=63(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=91(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=15(y1), r12=295(x2), r13=207(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 77
LDI r2, 63
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 91
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 15
LDI r12, 295
LDI r13, 207
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
