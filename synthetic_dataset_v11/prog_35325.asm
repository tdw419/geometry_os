; DESCRIPTION: Places a cyan line segment connecting (98, 227) to (40, 210).
; PLAN: r0=98(x1), r1=227(y1), r2=40(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 227
LDI r2, 40
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
