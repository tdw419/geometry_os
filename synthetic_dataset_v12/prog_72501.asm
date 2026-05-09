; DESCRIPTION: Composite: Draws a orange line from (161, 209) to (342, 74) then Renders a orange box of size 41x26 starting at (87, 166) then Sets a single white pixel at (407, 23).
; PLAN: r0=161(x1), r1=209(y1), r2=342(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=166(y), r7=41(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x), r11=23(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 209
LDI r2, 342
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 166
LDI r7, 41
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 23
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
