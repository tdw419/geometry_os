; DESCRIPTION: Places a blue line segment connecting (110, 215) to (122, 125).
; PLAN: r0=110(x1), r1=215(y1), r2=122(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 215
LDI r2, 122
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
