; DESCRIPTION: Composite: . Then Places a red 10x17 rectangle at position (145, 4). Then Renders a magenta line between points (16, 23) and (124, 198).
; PLAN: r0=145(x), r1=4(y), r2=10(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=16(x1), r1=23(y1), r2=124(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 10x17 rectangle at position (145, 4).
; PLAN: r0=145(x), r1=4(y), r2=10(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 4
LDI r2, 10
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (16, 23) and (124, 198).
; PLAN: r0=16(x1), r1=23(y1), r2=124(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 23
LDI r2, 124
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
