; DESCRIPTION: Places a blue line segment connecting (480, 209) to (231, 40).
; PLAN: r0=480(x1), r1=209(y1), r2=231(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 209
LDI r2, 231
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
