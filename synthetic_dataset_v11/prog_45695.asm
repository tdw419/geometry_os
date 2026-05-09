; DESCRIPTION: Composite: . Then Places a black 72x20 rectangle at position (107, 61). Then Places a magenta line segment connecting (36, 101) to (159, 178).
; PLAN: r0=107(x), r1=61(y), r2=72(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=36(x1), r1=101(y1), r2=159(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 72x20 rectangle at position (107, 61).
; PLAN: r0=107(x), r1=61(y), r2=72(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 61
LDI r2, 72
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (36, 101) to (159, 178).
; PLAN: r0=36(x1), r1=101(y1), r2=159(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 101
LDI r2, 159
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
