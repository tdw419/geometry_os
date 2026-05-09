; DESCRIPTION: Places a blue line segment connecting (209, 213) to (374, 2).
; PLAN: r0=209(x1), r1=213(y1), r2=374(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 213
LDI r2, 374
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
