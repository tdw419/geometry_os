; DESCRIPTION: Draws a cyan line from (366, 4) to (468, 22).
; PLAN: r0=366(x1), r1=4(y1), r2=468(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 4
LDI r2, 468
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
