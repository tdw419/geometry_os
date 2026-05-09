; DESCRIPTION: Composite: . Then Places a black 117x115 rectangle at position (84, 90). Then Draws a orange line from (103, 75) to (191, 208).
; PLAN: r0=84(x), r1=90(y), r2=117(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x1), r1=75(y1), r2=191(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 117x115 rectangle at position (84, 90).
; PLAN: r0=84(x), r1=90(y), r2=117(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 90
LDI r2, 117
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (103, 75) to (191, 208).
; PLAN: r0=103(x1), r1=75(y1), r2=191(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 75
LDI r2, 191
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
