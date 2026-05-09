; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (111, 247) to (45, 144). Then Places a purple 73x36 rectangle at position (128, 191).
; PLAN: r0=111(x1), r1=247(y1), r2=45(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=191(y), r2=73(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (111, 247) to (45, 144).
; PLAN: r0=111(x1), r1=247(y1), r2=45(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 247
LDI r2, 45
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 73x36 rectangle at position (128, 191).
; PLAN: r0=128(x), r1=191(y), r2=73(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 191
LDI r2, 73
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
