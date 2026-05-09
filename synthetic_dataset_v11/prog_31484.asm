; DESCRIPTION: Composite: . Then Places a black 32x79 rectangle at position (122, 58). Then Draws a yellow line from (14, 161) to (86, 147).
; PLAN: r0=122(x), r1=58(y), r2=32(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=14(x1), r1=161(y1), r2=86(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 32x79 rectangle at position (122, 58).
; PLAN: r0=122(x), r1=58(y), r2=32(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 58
LDI r2, 32
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (14, 161) to (86, 147).
; PLAN: r0=14(x1), r1=161(y1), r2=86(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 161
LDI r2, 86
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
