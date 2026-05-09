; DESCRIPTION: Composite: Draws a green line from (409, 79) to (40, 95) then Sets a single black pixel at (209, 90) then Renders a green box of size 102x98 starting at (159, 16).
; PLAN: r0=409(x1), r1=79(y1), r2=40(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=16(y), r12=102(width), r13=98(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 79
LDI r2, 40
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 159
LDI r11, 16
LDI r12, 102
LDI r13, 98
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
