; DESCRIPTION: Places a blue line segment connecting (215, 152) to (36, 255).
; PLAN: r0=215(x1), r1=152(y1), r2=36(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 152
LDI r2, 36
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
