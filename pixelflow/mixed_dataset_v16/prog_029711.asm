; DESCRIPTION: Places a white line segment connecting (56, 224) to (445, 73).
; PLAN: r0=56(x1), r1=224(y1), r2=445(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 224
LDI r2, 445
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
