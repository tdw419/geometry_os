; DESCRIPTION: Places a cyan line segment connecting (123, 92) to (11, 207).
; PLAN: r0=123(x1), r1=92(y1), r2=11(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 92
LDI r2, 11
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
