; DESCRIPTION: Places a black line segment connecting (154, 84) to (346, 20).
; PLAN: r0=154(x1), r1=84(y1), r2=346(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 84
LDI r2, 346
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
