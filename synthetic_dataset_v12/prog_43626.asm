; DESCRIPTION: Places a magenta line segment connecting (178, 234) to (128, 195).
; PLAN: r0=178(x1), r1=234(y1), r2=128(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 234
LDI r2, 128
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
