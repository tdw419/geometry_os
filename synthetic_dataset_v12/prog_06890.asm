; DESCRIPTION: Places a blue line segment connecting (117, 64) to (215, 249).
; PLAN: r0=117(x1), r1=64(y1), r2=215(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 64
LDI r2, 215
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
