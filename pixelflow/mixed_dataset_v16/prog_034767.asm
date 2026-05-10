; DESCRIPTION: Composite: Renders a magenta line between points (157, 230) and (215, 7) then Renders a red box of size 96x87 starting at (296, 56) then Renders a green disk with center (417, 48) and radius 47.
; PLAN: r0=157(x1), r1=230(y1), r2=215(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=56(y), r7=96(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=48(y), r12=47(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 230
LDI r2, 215
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 56
LDI r7, 96
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 48
LDI r12, 47
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
