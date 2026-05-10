; DESCRIPTION: Places a magenta line segment connecting (283, 165) to (292, 128).
; PLAN: r0=283(x1), r1=165(y1), r2=292(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 165
LDI r2, 292
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
