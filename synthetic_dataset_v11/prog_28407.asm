; DESCRIPTION: Places a red line segment connecting (101, 132) to (27, 242).
; PLAN: r0=101(x1), r1=132(y1), r2=27(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 132
LDI r2, 27
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
