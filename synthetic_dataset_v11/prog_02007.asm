; DESCRIPTION: Places a cyan line segment connecting (247, 134) to (169, 33).
; PLAN: r0=247(x1), r1=134(y1), r2=169(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 134
LDI r2, 169
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
