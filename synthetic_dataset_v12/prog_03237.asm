; DESCRIPTION: Places a blue line segment connecting (198, 213) to (289, 12).
; PLAN: r0=198(x1), r1=213(y1), r2=289(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 213
LDI r2, 289
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
