; DESCRIPTION: Places a green line segment connecting (190, 98) to (16, 18).
; PLAN: r0=190(x1), r1=98(y1), r2=16(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 98
LDI r2, 16
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
