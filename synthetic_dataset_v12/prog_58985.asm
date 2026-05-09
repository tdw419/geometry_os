; DESCRIPTION: Places a green line segment connecting (64, 178) to (215, 116).
; PLAN: r0=64(x1), r1=178(y1), r2=215(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 178
LDI r2, 215
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
