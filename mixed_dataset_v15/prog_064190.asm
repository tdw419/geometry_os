; DESCRIPTION: Composite: Draws a green line from (247, 117) to (138, 150) then Places a purple dot at position (112, 227) then Renders a cyan box of size 32x18 starting at (383, 58).
; PLAN: r0=247(x1), r1=117(y1), r2=138(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=227(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=58(y), r12=32(width), r13=18(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 117
LDI r2, 138
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 227
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 58
LDI r12, 32
LDI r13, 18
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
