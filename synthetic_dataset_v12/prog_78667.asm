; DESCRIPTION: Composite: Renders a orange line between points (164, 108) and (466, 103) then Draws a cyan rectangle at (70, 24) with width 78 and height 79 then Places a orange circle of radius 56 at center (289, 60).
; PLAN: r0=164(x1), r1=108(y1), r2=466(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=24(y), r7=78(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=289(x), r11=60(y), r12=56(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 108
LDI r2, 466
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 24
LDI r7, 78
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 60
LDI r12, 56
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
