; DESCRIPTION: Places a cyan line segment connecting (103, 51) to (97, 245).
; PLAN: r0=103(x1), r1=51(y1), r2=97(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 51
LDI r2, 97
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
