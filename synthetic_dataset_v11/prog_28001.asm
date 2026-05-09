; DESCRIPTION: Places a green line segment connecting (82, 104) to (68, 65).
; PLAN: r0=82(x1), r1=104(y1), r2=68(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 104
LDI r2, 68
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
