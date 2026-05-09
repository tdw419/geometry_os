; DESCRIPTION: Places a yellow line segment connecting (72, 241) to (365, 126).
; PLAN: r0=72(x1), r1=241(y1), r2=365(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 241
LDI r2, 365
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
