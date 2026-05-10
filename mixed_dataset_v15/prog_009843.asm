; DESCRIPTION: Composite: Creates a green circular shape at (89, 128) with radius 67 then Renders a cyan line between points (283, 63) and (440, 130) then Renders a yellow box of size 80x89 starting at (190, 96).
; PLAN: r0=89(x), r1=128(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=63(y1), r7=440(x2), r8=130(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=96(y), r12=80(width), r13=89(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 128
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 63
LDI r7, 440
LDI r8, 130
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 96
LDI r12, 80
LDI r13, 89
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
