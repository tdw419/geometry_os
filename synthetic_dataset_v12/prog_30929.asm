; DESCRIPTION: Places a cyan line segment connecting (493, 70) to (5, 156).
; PLAN: r0=493(x1), r1=70(y1), r2=5(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 70
LDI r2, 5
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
