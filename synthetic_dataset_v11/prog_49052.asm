; DESCRIPTION: Composite: . Then Places a magenta 73x96 rectangle at position (116, 67). Then Renders a magenta line between points (132, 61) and (31, 185).
; PLAN: r0=116(x), r1=67(y), r2=73(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x1), r1=61(y1), r2=31(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 73x96 rectangle at position (116, 67).
; PLAN: r0=116(x), r1=67(y), r2=73(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 67
LDI r2, 73
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (132, 61) and (31, 185).
; PLAN: r0=132(x1), r1=61(y1), r2=31(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 61
LDI r2, 31
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
