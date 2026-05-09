; DESCRIPTION: Places a green line segment connecting (224, 251) to (417, 210).
; PLAN: r0=224(x1), r1=251(y1), r2=417(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 251
LDI r2, 417
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
