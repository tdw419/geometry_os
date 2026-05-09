; DESCRIPTION: Places a blue line segment connecting (458, 231) to (340, 239).
; PLAN: r0=458(x1), r1=231(y1), r2=340(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 231
LDI r2, 340
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
