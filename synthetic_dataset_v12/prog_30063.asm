; DESCRIPTION: Places a yellow line segment connecting (144, 46) to (59, 16).
; PLAN: r0=144(x1), r1=46(y1), r2=59(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 46
LDI r2, 59
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
