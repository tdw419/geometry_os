; DESCRIPTION: Places a red line segment connecting (7, 77) to (480, 171).
; PLAN: r0=7(x1), r1=77(y1), r2=480(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 77
LDI r2, 480
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
