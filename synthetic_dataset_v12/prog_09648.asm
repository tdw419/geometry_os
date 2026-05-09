; DESCRIPTION: Places a blue line segment connecting (107, 242) to (229, 128).
; PLAN: r0=107(x1), r1=242(y1), r2=229(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 242
LDI r2, 229
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
