; DESCRIPTION: Places a blue line segment connecting (420, 234) to (420, 125).
; PLAN: r0=420(x1), r1=234(y1), r2=420(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 234
LDI r2, 420
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
