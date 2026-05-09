; DESCRIPTION: Composite: . Then Renders a magenta line between points (86, 28) and (246, 115). Then Places a purple 66x104 rectangle at position (101, 1).
; PLAN: r0=86(x1), r1=28(y1), r2=246(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=1(y), r2=66(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (86, 28) and (246, 115).
; PLAN: r0=86(x1), r1=28(y1), r2=246(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 28
LDI r2, 246
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 66x104 rectangle at position (101, 1).
; PLAN: r0=101(x), r1=1(y), r2=66(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 1
LDI r2, 66
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
