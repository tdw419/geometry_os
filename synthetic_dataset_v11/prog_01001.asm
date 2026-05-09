; DESCRIPTION: Places a red line segment connecting (179, 230) to (221, 231).
; PLAN: r0=179(x1), r1=230(y1), r2=221(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 230
LDI r2, 221
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
