; DESCRIPTION: Places a cyan line segment connecting (468, 164) to (501, 221).
; PLAN: r0=468(x1), r1=164(y1), r2=501(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 164
LDI r2, 501
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
