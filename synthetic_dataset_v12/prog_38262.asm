; DESCRIPTION: Places a green line segment connecting (276, 192) to (54, 182).
; PLAN: r0=276(x1), r1=192(y1), r2=54(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 192
LDI r2, 54
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
