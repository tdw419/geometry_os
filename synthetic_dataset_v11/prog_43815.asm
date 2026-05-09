; DESCRIPTION: Places a red line segment connecting (242, 249) to (142, 206).
; PLAN: r0=242(x1), r1=249(y1), r2=142(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 249
LDI r2, 142
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
