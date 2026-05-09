; DESCRIPTION: Composite: Places a cyan 16x75 rectangle at position (433, 50) then Sets a single white pixel at (195, 102) then Draws a blue line from (469, 35) to (409, 4).
; PLAN: r0=433(x), r1=50(y), r2=16(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=102(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=469(x1), r11=35(y1), r12=409(x2), r13=4(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 50
LDI r2, 16
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 102
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 469
LDI r11, 35
LDI r12, 409
LDI r13, 4
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
