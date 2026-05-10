; DESCRIPTION: Composite: Places a purple 75x56 rectangle at position (53, 123) then Places a magenta dot at position (1, 10) then Places a black line segment connecting (350, 42) to (115, 85).
; PLAN: r0=53(x), r1=123(y), r2=75(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=10(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=42(y1), r12=115(x2), r13=85(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 123
LDI r2, 75
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 10
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 350
LDI r11, 42
LDI r12, 115
LDI r13, 85
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
