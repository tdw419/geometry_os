; DESCRIPTION: Places a cyan line segment connecting (115, 224) to (462, 115).
; PLAN: r0=115(x1), r1=224(y1), r2=462(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 224
LDI r2, 462
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
