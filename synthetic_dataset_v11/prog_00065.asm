; DESCRIPTION: Places a green line segment connecting (198, 95) to (215, 56).
; PLAN: r0=198(x1), r1=95(y1), r2=215(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 95
LDI r2, 215
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
