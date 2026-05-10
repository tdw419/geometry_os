; DESCRIPTION: Places a cyan line segment connecting (331, 78) to (290, 241).
; PLAN: r0=331(x1), r1=78(y1), r2=290(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 78
LDI r2, 290
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
