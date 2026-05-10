; DESCRIPTION: Draws a magenta line from (442, 240) to (499, 200).
; PLAN: r0=442(x1), r1=240(y1), r2=499(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 240
LDI r2, 499
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
