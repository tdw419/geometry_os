; DESCRIPTION: Places a green line segment connecting (413, 175) to (50, 5).
; PLAN: r0=413(x1), r1=175(y1), r2=50(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 175
LDI r2, 50
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
