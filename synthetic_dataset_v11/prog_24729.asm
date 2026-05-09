; DESCRIPTION: Composite: . Then Places a red 86x101 rectangle at position (159, 64). Then Draws a magenta line from (104, 97) to (72, 109).
; PLAN: r0=159(x), r1=64(y), r2=86(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x1), r1=97(y1), r2=72(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 86x101 rectangle at position (159, 64).
; PLAN: r0=159(x), r1=64(y), r2=86(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 64
LDI r2, 86
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (104, 97) to (72, 109).
; PLAN: r0=104(x1), r1=97(y1), r2=72(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 97
LDI r2, 72
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
