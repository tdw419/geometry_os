; DESCRIPTION: Places a cyan line segment connecting (472, 117) to (247, 2).
; PLAN: r0=472(x1), r1=117(y1), r2=247(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 117
LDI r2, 247
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
