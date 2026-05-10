; DESCRIPTION: Places a green line segment connecting (198, 73) to (215, 175).
; PLAN: r0=198(x1), r1=73(y1), r2=215(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 73
LDI r2, 215
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
