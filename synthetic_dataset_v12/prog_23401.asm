; DESCRIPTION: Composite: Draws a cyan line from (61, 195) to (306, 187) then Places a blue dot at position (252, 122) then Draws a magenta circle centered at (337, 48) with radius 24.
; PLAN: r0=61(x1), r1=195(y1), r2=306(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=122(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=48(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 195
LDI r2, 306
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 122
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 48
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
