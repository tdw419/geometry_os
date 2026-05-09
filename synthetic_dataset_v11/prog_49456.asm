; DESCRIPTION: Places a white line segment connecting (44, 77) to (224, 242).
; PLAN: r0=44(x1), r1=77(y1), r2=224(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 77
LDI r2, 224
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
