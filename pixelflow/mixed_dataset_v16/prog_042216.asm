; DESCRIPTION: Places a green line segment connecting (324, 219) to (27, 37).
; PLAN: r0=324(x1), r1=219(y1), r2=27(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 219
LDI r2, 27
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
