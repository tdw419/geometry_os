; DESCRIPTION: Places a cyan line segment connecting (22, 126) to (212, 13).
; PLAN: r0=22(x1), r1=126(y1), r2=212(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 126
LDI r2, 212
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
