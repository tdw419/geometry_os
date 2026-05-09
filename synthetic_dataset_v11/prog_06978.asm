; DESCRIPTION: Composite: . Then Draws a purple line from (0, 178) to (141, 199). Then Places a cyan 88x91 rectangle at position (133, 90).
; PLAN: r0=0(x1), r1=178(y1), r2=141(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=90(y), r2=88(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (0, 178) to (141, 199).
; PLAN: r0=0(x1), r1=178(y1), r2=141(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 178
LDI r2, 141
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 88x91 rectangle at position (133, 90).
; PLAN: r0=133(x), r1=90(y), r2=88(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 90
LDI r2, 88
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
