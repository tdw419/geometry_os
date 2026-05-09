; DESCRIPTION: Places a green line segment connecting (190, 234) to (255, 45).
; PLAN: r0=190(x1), r1=234(y1), r2=255(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 234
LDI r2, 255
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
