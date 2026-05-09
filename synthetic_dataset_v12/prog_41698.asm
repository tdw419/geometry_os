; DESCRIPTION: Places a cyan line segment connecting (192, 114) to (352, 131).
; PLAN: r0=192(x1), r1=114(y1), r2=352(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 114
LDI r2, 352
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
