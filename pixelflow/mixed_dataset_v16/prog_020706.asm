; DESCRIPTION: Composite: Places a magenta line segment connecting (328, 12) to (82, 44) then Places a blue dot at position (19, 36) then Places a purple circle of radius 12 at center (237, 76).
; PLAN: r0=328(x1), r1=12(y1), r2=82(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=36(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=76(y), r12=12(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 12
LDI r2, 82
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 36
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 237
LDI r11, 76
LDI r12, 12
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
