; DESCRIPTION: Composite: . Then Renders a green line between points (168, 63) and (89, 15). Then Renders a blue box of size 19x47 starting at (123, 159).
; PLAN: r0=168(x1), r1=63(y1), r2=89(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=123(x), r1=159(y), r2=19(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (168, 63) and (89, 15).
; PLAN: r0=168(x1), r1=63(y1), r2=89(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 63
LDI r2, 89
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 19x47 starting at (123, 159).
; PLAN: r0=123(x), r1=159(y), r2=19(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 159
LDI r2, 19
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
