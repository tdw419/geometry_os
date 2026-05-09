; DESCRIPTION: Places a blue line segment connecting (446, 99) to (415, 128).
; PLAN: r0=446(x1), r1=99(y1), r2=415(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 99
LDI r2, 415
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
