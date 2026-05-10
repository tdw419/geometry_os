; DESCRIPTION: Composite: Renders a magenta box of size 111x59 starting at (97, 73) then Places a red dot at position (261, 80) then Draws a magenta line from (247, 232) to (367, 53).
; PLAN: r0=97(x), r1=73(y), r2=111(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=247(x1), r11=232(y1), r12=367(x2), r13=53(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 73
LDI r2, 111
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 247
LDI r11, 232
LDI r12, 367
LDI r13, 53
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
