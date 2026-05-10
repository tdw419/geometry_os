; DESCRIPTION: Composite: Places a green dot at position (388, 153) then Draws a blue line from (148, 116) to (385, 103) then Renders a black box of size 83x18 starting at (19, 127).
; PLAN: r0=388(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=116(y1), r7=385(x2), r8=103(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=127(y), r12=83(width), r13=18(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 116
LDI r7, 385
LDI r8, 103
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 127
LDI r12, 83
LDI r13, 18
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
