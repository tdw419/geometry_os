; DESCRIPTION: Places a green line segment connecting (74, 98) to (116, 46).
; PLAN: r0=74(x1), r1=98(y1), r2=116(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 98
LDI r2, 116
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
