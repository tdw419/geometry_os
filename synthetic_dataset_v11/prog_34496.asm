; DESCRIPTION: Places a cyan line segment connecting (45, 148) to (229, 162).
; PLAN: r0=45(x1), r1=148(y1), r2=229(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 148
LDI r2, 229
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
