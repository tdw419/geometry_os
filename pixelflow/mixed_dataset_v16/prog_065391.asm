; DESCRIPTION: Composite: Draws a cyan line from (329, 159) to (159, 226) then Draws a purple rectangle at (368, 47) with width 79 and height 120 then Creates a orange circular shape at (243, 65) with radius 17.
; PLAN: r0=329(x1), r1=159(y1), r2=159(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=47(y), r7=79(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=65(y), r12=17(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 159
LDI r2, 159
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 47
LDI r7, 79
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 65
LDI r12, 17
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
