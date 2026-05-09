; DESCRIPTION: Places a red line segment connecting (242, 174) to (56, 231).
; PLAN: r0=242(x1), r1=174(y1), r2=56(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 174
LDI r2, 56
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
