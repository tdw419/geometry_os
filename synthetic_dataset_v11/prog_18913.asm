; DESCRIPTION: Places a cyan line segment connecting (169, 177) to (72, 36).
; PLAN: r0=169(x1), r1=177(y1), r2=72(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 177
LDI r2, 72
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
