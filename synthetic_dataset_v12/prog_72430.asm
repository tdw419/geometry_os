; DESCRIPTION: Composite: Draws a cyan circle centered at (224, 197) with radius 17 then Renders a purple box of size 35x113 starting at (87, 97) then Renders a red line between points (280, 222) and (283, 134).
; PLAN: r0=224(x), r1=197(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=97(y), r7=35(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=222(y1), r12=283(x2), r13=134(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 197
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 97
LDI r7, 35
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 222
LDI r12, 283
LDI r13, 134
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
