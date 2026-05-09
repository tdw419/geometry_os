; DESCRIPTION: Composite: Draws a cyan line from (50, 133) to (64, 40) then Creates a green rectangular region at (48, 69) spanning 25 by 120 pixels then Places a orange circle of radius 41 at center (155, 50).
; PLAN: r0=50(x1), r1=133(y1), r2=64(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=69(y), r7=25(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=50(y), r12=41(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 133
LDI r2, 64
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 69
LDI r7, 25
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 50
LDI r12, 41
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
