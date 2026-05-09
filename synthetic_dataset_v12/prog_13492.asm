; DESCRIPTION: Places a green line segment connecting (220, 162) to (239, 93).
; PLAN: r0=220(x1), r1=162(y1), r2=239(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 162
LDI r2, 239
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
