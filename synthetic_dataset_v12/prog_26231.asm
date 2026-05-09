; DESCRIPTION: Places a cyan line segment connecting (92, 66) to (161, 148).
; PLAN: r0=92(x1), r1=66(y1), r2=161(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 66
LDI r2, 161
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
