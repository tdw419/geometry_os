; DESCRIPTION: Places a green line segment connecting (21, 130) to (231, 76).
; PLAN: r0=21(x1), r1=130(y1), r2=231(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 130
LDI r2, 231
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
