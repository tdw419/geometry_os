; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (52, 92) to (18, 152). Then Places a cyan 81x88 rectangle at position (52, 49).
; PLAN: r0=52(x1), r1=92(y1), r2=18(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=49(y), r2=81(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (52, 92) to (18, 152).
; PLAN: r0=52(x1), r1=92(y1), r2=18(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 92
LDI r2, 18
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 81x88 rectangle at position (52, 49).
; PLAN: r0=52(x), r1=49(y), r2=81(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 49
LDI r2, 81
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
