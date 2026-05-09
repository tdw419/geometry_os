; DESCRIPTION: Composite: . Then Places a green circle of radius 67 at center (127, 75). Then Draws a blue line from (254, 224) to (81, 128).
; PLAN: r0=127(x), r1=75(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=224(y1), r2=81(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 67 at center (127, 75).
; PLAN: r0=127(x), r1=75(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 75
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (254, 224) to (81, 128).
; PLAN: r0=254(x1), r1=224(y1), r2=81(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 224
LDI r2, 81
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
