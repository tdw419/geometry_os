; DESCRIPTION: Composite: Draws a white circle centered at (406, 154) with radius 63 then Places a purple dot at position (237, 48) then Draws a purple line from (196, 176) to (434, 179).
; PLAN: r0=406(x), r1=154(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=48(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=196(x1), r11=176(y1), r12=434(x2), r13=179(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 154
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 48
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 196
LDI r11, 176
LDI r12, 434
LDI r13, 179
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
