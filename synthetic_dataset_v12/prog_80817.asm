; DESCRIPTION: Composite: Renders a blue box of size 113x93 starting at (397, 138) then Draws a black line from (337, 232) to (4, 154) then Places a blue circle of radius 69 at center (301, 76).
; PLAN: r0=397(x), r1=138(y), r2=113(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x1), r6=232(y1), r7=4(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=76(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 397
LDI r1, 138
LDI r2, 113
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 232
LDI r7, 4
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 76
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
