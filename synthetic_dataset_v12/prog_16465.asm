; DESCRIPTION: Composite: Draws a blue line from (352, 247) to (160, 67) then Places a blue dot at position (263, 170) then Renders a magenta disk with center (196, 97) and radius 26.
; PLAN: r0=352(x1), r1=247(y1), r2=160(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=170(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=196(x), r11=97(y), r12=26(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 247
LDI r2, 160
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 170
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 196
LDI r11, 97
LDI r12, 26
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
