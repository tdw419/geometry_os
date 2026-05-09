; DESCRIPTION: Places a green line segment connecting (413, 11) to (281, 81).
; PLAN: r0=413(x1), r1=11(y1), r2=281(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 11
LDI r2, 281
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
