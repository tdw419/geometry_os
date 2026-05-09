; DESCRIPTION: Places a red line segment connecting (19, 12) to (327, 21).
; PLAN: r0=19(x1), r1=12(y1), r2=327(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 12
LDI r2, 327
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
