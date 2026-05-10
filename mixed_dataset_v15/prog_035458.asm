; DESCRIPTION: Places a green line segment connecting (98, 60) to (220, 16).
; PLAN: r0=98(x1), r1=60(y1), r2=220(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 60
LDI r2, 220
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
