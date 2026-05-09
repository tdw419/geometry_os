; DESCRIPTION: Composite: Places a magenta circle of radius 26 at center (27, 124) then Draws a black line from (53, 59) to (185, 79) then Renders a orange box of size 57x69 starting at (31, 139).
; PLAN: r0=27(x), r1=124(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=59(y1), r7=185(x2), r8=79(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=139(y), r12=57(width), r13=69(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 124
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 59
LDI r7, 185
LDI r8, 79
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 139
LDI r12, 57
LDI r13, 69
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
