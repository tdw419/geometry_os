; DESCRIPTION: Composite: Draws a green line from (250, 20) to (447, 124) then Places a purple dot at position (272, 188) then Places a orange 28x74 rectangle at position (412, 42).
; PLAN: r0=250(x1), r1=20(y1), r2=447(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=188(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=412(x), r11=42(y), r12=28(width), r13=74(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 20
LDI r2, 447
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 188
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 412
LDI r11, 42
LDI r12, 28
LDI r13, 74
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
