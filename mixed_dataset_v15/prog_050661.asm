; DESCRIPTION: Composite: Draws a cyan rectangle at (378, 190) with width 66 and height 63 then Places a yellow circle of radius 42 at center (442, 54) then Draws a orange line from (402, 129) to (150, 73).
; PLAN: r0=378(x), r1=190(y), r2=66(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=54(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x1), r11=129(y1), r12=150(x2), r13=73(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 190
LDI r2, 66
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 54
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 129
LDI r12, 150
LDI r13, 73
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
