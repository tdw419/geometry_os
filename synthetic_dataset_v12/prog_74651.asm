; DESCRIPTION: Composite: Places a cyan 27x99 rectangle at position (470, 48) then Renders a yellow line between points (195, 108) and (63, 183) then Creates a blue circular shape at (104, 78) with radius 20.
; PLAN: r0=470(x), r1=48(y), r2=27(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=108(y1), r7=63(x2), r8=183(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=78(y), r12=20(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 470
LDI r1, 48
LDI r2, 27
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 108
LDI r7, 63
LDI r8, 183
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 78
LDI r12, 20
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
