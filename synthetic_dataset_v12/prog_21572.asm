; DESCRIPTION: Places a red line segment connecting (59, 116) to (294, 25).
; PLAN: r0=59(x1), r1=116(y1), r2=294(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 116
LDI r2, 294
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
