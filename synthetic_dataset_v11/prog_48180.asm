; DESCRIPTION: Places a green line segment connecting (239, 50) to (120, 165).
; PLAN: r0=239(x1), r1=50(y1), r2=120(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 50
LDI r2, 120
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
