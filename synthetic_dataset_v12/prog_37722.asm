; DESCRIPTION: Composite: Renders a green disk with center (86, 181) and radius 74 then Draws a orange rectangle at (285, 66) with width 90 and height 65 then Draws a cyan line from (197, 89) to (292, 23).
; PLAN: r0=86(x), r1=181(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=66(y), r7=90(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x1), r11=89(y1), r12=292(x2), r13=23(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 181
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 66
LDI r7, 90
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 89
LDI r12, 292
LDI r13, 23
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
