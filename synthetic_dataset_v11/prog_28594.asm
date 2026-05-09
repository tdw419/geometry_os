; DESCRIPTION: Composite: . Then Renders a green line between points (23, 125) and (155, 6). Then Places a blue 87x40 rectangle at position (101, 98).
; PLAN: r0=23(x1), r1=125(y1), r2=155(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=98(y), r2=87(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (23, 125) and (155, 6).
; PLAN: r0=23(x1), r1=125(y1), r2=155(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 125
LDI r2, 155
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 87x40 rectangle at position (101, 98).
; PLAN: r0=101(x), r1=98(y), r2=87(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 98
LDI r2, 87
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
