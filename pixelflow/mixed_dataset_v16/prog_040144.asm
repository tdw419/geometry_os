; DESCRIPTION: Composite: Places a magenta circle of radius 34 at center (41, 99) then Places a cyan line segment connecting (127, 223) to (319, 163) then Creates a red rectangular region at (392, 105) spanning 50 by 120 pixels.
; PLAN: r0=41(x), r1=99(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=223(y1), r7=319(x2), r8=163(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=105(y), r12=50(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 99
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 223
LDI r7, 319
LDI r8, 163
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 105
LDI r12, 50
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
