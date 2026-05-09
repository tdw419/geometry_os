; DESCRIPTION: Places a magenta line segment connecting (397, 37) to (207, 101).
; PLAN: r0=397(x1), r1=37(y1), r2=207(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 37
LDI r2, 207
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
