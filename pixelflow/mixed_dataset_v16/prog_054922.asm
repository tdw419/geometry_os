; DESCRIPTION: Composite: Draws a cyan line from (33, 13) to (488, 202) then Creates a magenta rectangular region at (265, 76) spanning 107 by 51 pixels then Places a orange circle of radius 46 at center (137, 63).
; PLAN: r0=33(x1), r1=13(y1), r2=488(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=76(y), r7=107(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=63(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 13
LDI r2, 488
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 76
LDI r7, 107
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 63
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
