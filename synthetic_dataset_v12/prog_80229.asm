; DESCRIPTION: Places a green line segment connecting (28, 178) to (63, 28).
; PLAN: r0=28(x1), r1=178(y1), r2=63(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 178
LDI r2, 63
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
