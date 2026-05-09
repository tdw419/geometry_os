; DESCRIPTION: Composite: Renders a purple box of size 79x69 starting at (196, 16) then Draws a blue line from (380, 3) to (218, 166) then Draws a orange circle centered at (469, 33) with radius 18.
; PLAN: r0=196(x), r1=16(y), r2=79(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=3(y1), r7=218(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=33(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 16
LDI r2, 79
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 3
LDI r7, 218
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 33
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
