; DESCRIPTION: Composite: Draws a purple line from (464, 222) to (160, 217) then Places a cyan dot at position (221, 24) then Creates a magenta circular shape at (409, 202) with radius 42.
; PLAN: r0=464(x1), r1=222(y1), r2=160(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=24(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=202(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 222
LDI r2, 160
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 24
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 202
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
