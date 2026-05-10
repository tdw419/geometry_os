; DESCRIPTION: Composite: Draws a cyan line from (389, 171) to (373, 42) then Sets a single magenta pixel at (101, 72) then Places a purple 62x27 rectangle at position (99, 162).
; PLAN: r0=389(x1), r1=171(y1), r2=373(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=72(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=162(y), r12=62(width), r13=27(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 171
LDI r2, 373
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 72
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 99
LDI r11, 162
LDI r12, 62
LDI r13, 27
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
