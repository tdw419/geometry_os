; DESCRIPTION: Composite: Places a black line segment connecting (386, 194) to (172, 167) then Places a red dot at position (431, 134) then Renders a yellow box of size 102x68 starting at (397, 67).
; PLAN: r0=386(x1), r1=194(y1), r2=172(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=67(y), r12=102(width), r13=68(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 194
LDI r2, 172
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 397
LDI r11, 67
LDI r12, 102
LDI r13, 68
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
