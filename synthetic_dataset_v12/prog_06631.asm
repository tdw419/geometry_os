; DESCRIPTION: Places a red line segment connecting (271, 50) to (59, 52).
; PLAN: r0=271(x1), r1=50(y1), r2=59(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 50
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
