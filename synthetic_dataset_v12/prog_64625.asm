; DESCRIPTION: Places a green line segment connecting (116, 171) to (248, 59).
; PLAN: r0=116(x1), r1=171(y1), r2=248(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 171
LDI r2, 248
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
