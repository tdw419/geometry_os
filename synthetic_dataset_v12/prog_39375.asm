; DESCRIPTION: Places a cyan line segment connecting (431, 70) to (290, 32).
; PLAN: r0=431(x1), r1=70(y1), r2=290(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 70
LDI r2, 290
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
