; DESCRIPTION: Composite: Renders a green disk with center (137, 64) and radius 19 then Renders a yellow line between points (13, 154) and (493, 244) then Renders a magenta box of size 10x11 starting at (55, 215).
; PLAN: r0=137(x), r1=64(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=154(y1), r7=493(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=215(y), r12=10(width), r13=11(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 64
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 154
LDI r7, 493
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 215
LDI r12, 10
LDI r13, 11
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
