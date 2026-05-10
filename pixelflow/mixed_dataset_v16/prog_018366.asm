; DESCRIPTION: Composite: Draws a cyan line from (308, 250) to (89, 146) then Places a magenta circle of radius 67 at center (150, 119) then Draws a orange rectangle at (372, 79) with width 94 and height 101.
; PLAN: r0=308(x1), r1=250(y1), r2=89(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=119(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=372(x), r11=79(y), r12=94(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 250
LDI r2, 89
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 119
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 372
LDI r11, 79
LDI r12, 94
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
