; DESCRIPTION: Composite: Places a orange dot at position (253, 60) then Renders a purple box of size 55x85 starting at (427, 166) then Draws a black line from (340, 161) to (39, 66).
; PLAN: r0=253(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=166(y), r7=55(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x1), r11=161(y1), r12=39(x2), r13=66(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 427
LDI r6, 166
LDI r7, 55
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 161
LDI r12, 39
LDI r13, 66
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
