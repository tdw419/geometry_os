; DESCRIPTION: Places a cyan line segment connecting (112, 60) to (246, 100).
; PLAN: r0=112(x1), r1=60(y1), r2=246(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 60
LDI r2, 246
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
