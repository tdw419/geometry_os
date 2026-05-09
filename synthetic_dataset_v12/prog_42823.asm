; DESCRIPTION: Places a red line segment connecting (410, 36) to (47, 167).
; PLAN: r0=410(x1), r1=36(y1), r2=47(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 36
LDI r2, 47
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
