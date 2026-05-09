; DESCRIPTION: Places a yellow line segment connecting (239, 109) to (75, 120).
; PLAN: r0=239(x1), r1=109(y1), r2=75(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 109
LDI r2, 75
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
