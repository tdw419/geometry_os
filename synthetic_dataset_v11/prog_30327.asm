; DESCRIPTION: Composite: . Then Draws a green line from (160, 206) to (84, 203). Then Creates a blue circular shape at (159, 87) with radius 27.
; PLAN: r0=160(x1), r1=206(y1), r2=84(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=87(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (160, 206) to (84, 203).
; PLAN: r0=160(x1), r1=206(y1), r2=84(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 206
LDI r2, 84
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (159, 87) with radius 27.
; PLAN: r0=159(x), r1=87(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 87
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
