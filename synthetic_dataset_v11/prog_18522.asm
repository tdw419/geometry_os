; DESCRIPTION: Places a red line segment connecting (167, 177) to (91, 192).
; PLAN: r0=167(x1), r1=177(y1), r2=91(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 177
LDI r2, 91
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
