; DESCRIPTION: Places a green line segment connecting (498, 65) to (206, 67).
; PLAN: r0=498(x1), r1=65(y1), r2=206(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 65
LDI r2, 206
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
