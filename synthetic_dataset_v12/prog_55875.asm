; DESCRIPTION: Places a red line segment connecting (458, 178) to (371, 231).
; PLAN: r0=458(x1), r1=178(y1), r2=371(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 178
LDI r2, 371
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
