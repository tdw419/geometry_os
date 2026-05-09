; DESCRIPTION: Composite: Draws a green line from (472, 222) to (494, 171) then Places a purple circle of radius 72 at center (90, 127).
; PLAN: r0=472(x1), r1=222(y1), r2=494(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=127(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 472
LDI r1, 222
LDI r2, 494
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 127
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
