; DESCRIPTION: Places a green line segment connecting (24, 16) to (19, 37).
; PLAN: r0=24(x1), r1=16(y1), r2=19(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 16
LDI r2, 19
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
