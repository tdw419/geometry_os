; DESCRIPTION: Composite: Renders a blue disk with center (45, 99) and radius 36 then Places a cyan dot at position (15, 91) then Draws a blue line from (131, 249) to (294, 116).
; PLAN: r0=45(x), r1=99(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=91(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=131(x1), r11=249(y1), r12=294(x2), r13=116(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 99
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 91
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 131
LDI r11, 249
LDI r12, 294
LDI r13, 116
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
