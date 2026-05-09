; DESCRIPTION: Places a cyan line segment connecting (224, 89) to (13, 214).
; PLAN: r0=224(x1), r1=89(y1), r2=13(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 89
LDI r2, 13
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
