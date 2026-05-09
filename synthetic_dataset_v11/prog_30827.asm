; DESCRIPTION: Places a green line segment connecting (42, 132) to (104, 237).
; PLAN: r0=42(x1), r1=132(y1), r2=104(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 132
LDI r2, 104
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
