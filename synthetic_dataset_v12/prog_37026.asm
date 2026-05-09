; DESCRIPTION: Composite: Draws a cyan line from (414, 114) to (324, 216) then Places a yellow dot at position (447, 226) then Places a purple 61x19 rectangle at position (420, 69).
; PLAN: r0=414(x1), r1=114(y1), r2=324(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=226(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=69(y), r12=61(width), r13=19(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 114
LDI r2, 324
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 226
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 420
LDI r11, 69
LDI r12, 61
LDI r13, 19
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
