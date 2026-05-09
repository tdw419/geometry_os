; DESCRIPTION: Composite: Draws a black line from (90, 230) to (23, 161) then Renders a orange box of size 35x105 starting at (82, 101) then Sets a single cyan pixel at (131, 58).
; PLAN: r0=90(x1), r1=230(y1), r2=23(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=101(y), r7=35(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x), r11=58(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 230
LDI r2, 23
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 101
LDI r7, 35
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 58
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
