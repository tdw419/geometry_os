; DESCRIPTION: Places a white line segment connecting (189, 245) to (187, 224).
; PLAN: r0=189(x1), r1=245(y1), r2=187(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 245
LDI r2, 187
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
