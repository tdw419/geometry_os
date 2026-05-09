; DESCRIPTION: Places a white line segment connecting (492, 154) to (300, 49).
; PLAN: r0=492(x1), r1=154(y1), r2=300(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 154
LDI r2, 300
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
