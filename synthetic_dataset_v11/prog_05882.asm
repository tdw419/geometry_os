; DESCRIPTION: Renders a green line between points (31, 48) and (117, 162).
; PLAN: r0=31(x1), r1=48(y1), r2=117(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 48
LDI r2, 117
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
