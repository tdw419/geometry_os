; DESCRIPTION: Places a magenta line segment connecting (371, 128) to (374, 113).
; PLAN: r0=371(x1), r1=128(y1), r2=374(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 128
LDI r2, 374
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
