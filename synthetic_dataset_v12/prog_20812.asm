; DESCRIPTION: Places a cyan line segment connecting (131, 55) to (350, 56).
; PLAN: r0=131(x1), r1=55(y1), r2=350(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 55
LDI r2, 350
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
