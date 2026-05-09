; DESCRIPTION: Places a cyan line segment connecting (398, 240) to (432, 162).
; PLAN: r0=398(x1), r1=240(y1), r2=432(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 240
LDI r2, 432
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
