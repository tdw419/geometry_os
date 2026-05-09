; DESCRIPTION: Places a blue line segment connecting (64, 135) to (91, 213).
; PLAN: r0=64(x1), r1=135(y1), r2=91(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 135
LDI r2, 91
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
