; DESCRIPTION: Composite: . Then Places a purple 16x51 rectangle at position (215, 59). Then Places a black line segment connecting (156, 94) to (59, 14).
; PLAN: r0=215(x), r1=59(y), r2=16(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=156(x1), r1=94(y1), r2=59(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 16x51 rectangle at position (215, 59).
; PLAN: r0=215(x), r1=59(y), r2=16(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 16
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (156, 94) to (59, 14).
; PLAN: r0=156(x1), r1=94(y1), r2=59(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 94
LDI r2, 59
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
