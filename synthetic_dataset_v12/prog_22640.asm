; DESCRIPTION: Draws a green line from (52, 22) to (187, 162).
; PLAN: r0=52(x1), r1=22(y1), r2=187(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 22
LDI r2, 187
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
