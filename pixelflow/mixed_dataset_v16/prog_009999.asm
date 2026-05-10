; DESCRIPTION: Places a blue line segment connecting (28, 239) to (107, 236).
; PLAN: r0=28(x1), r1=239(y1), r2=107(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 239
LDI r2, 107
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
