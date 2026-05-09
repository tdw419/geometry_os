; DESCRIPTION: Places a red line segment connecting (336, 97) to (410, 33).
; PLAN: r0=336(x1), r1=97(y1), r2=410(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 97
LDI r2, 410
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
