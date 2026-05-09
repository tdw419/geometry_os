; DESCRIPTION: Places a white line segment connecting (281, 224) to (326, 124).
; PLAN: r0=281(x1), r1=224(y1), r2=326(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 224
LDI r2, 326
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
