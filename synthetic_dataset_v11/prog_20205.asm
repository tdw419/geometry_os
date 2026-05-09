; DESCRIPTION: Places a cyan line segment connecting (84, 175) to (72, 36).
; PLAN: r0=84(x1), r1=175(y1), r2=72(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 175
LDI r2, 72
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
