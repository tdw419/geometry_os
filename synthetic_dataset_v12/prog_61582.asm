; DESCRIPTION: Places a blue line segment connecting (492, 105) to (143, 210).
; PLAN: r0=492(x1), r1=105(y1), r2=143(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 105
LDI r2, 143
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
