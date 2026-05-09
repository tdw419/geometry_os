; DESCRIPTION: Places a cyan line segment connecting (70, 72) to (170, 102).
; PLAN: r0=70(x1), r1=72(y1), r2=170(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 72
LDI r2, 170
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
