; DESCRIPTION: Places a green line segment connecting (123, 239) to (143, 205).
; PLAN: r0=123(x1), r1=239(y1), r2=143(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 239
LDI r2, 143
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
