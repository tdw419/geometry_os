; DESCRIPTION: Composite: Places a purple circle of radius 55 at center (173, 87) then Draws a blue line from (198, 53) to (423, 185) then Places a magenta dot at position (194, 243).
; PLAN: r0=173(x), r1=87(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=53(y1), r7=423(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=243(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 87
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 53
LDI r7, 423
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 243
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
