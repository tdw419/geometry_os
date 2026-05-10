; DESCRIPTION: Places a green line segment connecting (33, 239) to (89, 150).
; PLAN: r0=33(x1), r1=239(y1), r2=89(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 239
LDI r2, 89
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
