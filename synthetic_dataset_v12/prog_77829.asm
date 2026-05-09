; DESCRIPTION: Places a green line segment connecting (144, 146) to (15, 182).
; PLAN: r0=144(x1), r1=146(y1), r2=15(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 146
LDI r2, 15
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
