; DESCRIPTION: Places a red line segment connecting (334, 151) to (410, 219).
; PLAN: r0=334(x1), r1=151(y1), r2=410(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 151
LDI r2, 410
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
