; DESCRIPTION: Places a green line segment connecting (104, 231) to (340, 14).
; PLAN: r0=104(x1), r1=231(y1), r2=340(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 231
LDI r2, 340
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
