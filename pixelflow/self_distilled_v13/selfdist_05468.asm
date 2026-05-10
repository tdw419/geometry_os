; DESCRIPTION: Renders a yellow line segment connecting (116, 59) to (333, 187).
; PLAN: r0=116(x1), r1=59(y1), r2=333(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 59
LDI r2, 333
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
