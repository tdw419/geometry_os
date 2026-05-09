; DESCRIPTION: Places a green line segment connecting (168, 4) to (456, 122).
; PLAN: r0=168(x1), r1=4(y1), r2=456(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 4
LDI r2, 456
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
