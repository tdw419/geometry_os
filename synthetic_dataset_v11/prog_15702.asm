; DESCRIPTION: Composite: . Then Places a orange 95x26 rectangle at position (70, 106). Then Draws a purple line from (176, 150) to (52, 4).
; PLAN: r0=70(x), r1=106(y), r2=95(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x1), r1=150(y1), r2=52(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 95x26 rectangle at position (70, 106).
; PLAN: r0=70(x), r1=106(y), r2=95(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 106
LDI r2, 95
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (176, 150) to (52, 4).
; PLAN: r0=176(x1), r1=150(y1), r2=52(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 150
LDI r2, 52
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
