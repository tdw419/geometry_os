; DESCRIPTION: Places a green line segment connecting (206, 83) to (59, 114).
; PLAN: r0=206(x1), r1=83(y1), r2=59(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 83
LDI r2, 59
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
