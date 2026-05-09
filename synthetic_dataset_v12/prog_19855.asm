; DESCRIPTION: Places a cyan line segment connecting (290, 25) to (1, 250).
; PLAN: r0=290(x1), r1=25(y1), r2=1(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 25
LDI r2, 1
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
