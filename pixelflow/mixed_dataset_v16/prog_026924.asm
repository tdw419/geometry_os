; DESCRIPTION: Composite: Draws a purple line from (493, 125) to (320, 201) then Places a yellow dot at position (201, 51) then Creates a magenta rectangular region at (367, 42) spanning 20 by 32 pixels.
; PLAN: r0=493(x1), r1=125(y1), r2=320(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=51(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=367(x), r11=42(y), r12=20(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 125
LDI r2, 320
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 51
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 367
LDI r11, 42
LDI r12, 20
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
