; DESCRIPTION: Places a green line segment connecting (21, 165) to (82, 203).
; PLAN: r0=21(x1), r1=165(y1), r2=82(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 165
LDI r2, 82
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
