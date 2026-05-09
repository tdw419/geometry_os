; DESCRIPTION: Composite: . Then Places a blue circle of radius 62 at center (180, 108). Then Draws a green line from (18, 85) to (128, 136).
; PLAN: r0=180(x), r1=108(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x1), r1=85(y1), r2=128(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 62 at center (180, 108).
; PLAN: r0=180(x), r1=108(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 108
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (18, 85) to (128, 136).
; PLAN: r0=18(x1), r1=85(y1), r2=128(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 85
LDI r2, 128
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
