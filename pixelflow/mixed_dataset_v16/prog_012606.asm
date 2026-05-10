; DESCRIPTION: Places a yellow line segment connecting (371, 194) to (305, 231).
; PLAN: r0=371(x1), r1=194(y1), r2=305(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 194
LDI r2, 305
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
