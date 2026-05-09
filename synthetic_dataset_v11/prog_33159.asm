; DESCRIPTION: Places a red line segment connecting (209, 79) to (231, 6).
; PLAN: r0=209(x1), r1=79(y1), r2=231(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 79
LDI r2, 231
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
