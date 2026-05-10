; DESCRIPTION: Draws a cyan line from (100, 170) to (72, 33).
; PLAN: r0=100(x1), r1=170(y1), r2=72(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 170
LDI r2, 72
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
