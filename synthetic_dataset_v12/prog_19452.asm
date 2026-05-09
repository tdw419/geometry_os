; DESCRIPTION: Composite: Places a black 56x43 rectangle at position (234, 118) then Sets a single cyan pixel at (127, 231) then Places a purple circle of radius 60 at center (342, 140).
; PLAN: r0=234(x), r1=118(y), r2=56(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=140(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 118
LDI r2, 56
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 140
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
