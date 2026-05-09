; DESCRIPTION: Composite: . Then Draws a purple line from (163, 120) to (20, 109). Then Places a orange 60x105 rectangle at position (1, 150).
; PLAN: r0=163(x1), r1=120(y1), r2=20(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=1(x), r1=150(y), r2=60(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (163, 120) to (20, 109).
; PLAN: r0=163(x1), r1=120(y1), r2=20(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 120
LDI r2, 20
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 60x105 rectangle at position (1, 150).
; PLAN: r0=1(x), r1=150(y), r2=60(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 150
LDI r2, 60
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
