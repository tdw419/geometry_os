; DESCRIPTION: Draws a red line from (92, 0) to (171, 49).
; PLAN: r0=92(x1), r1=0(y1), r2=171(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 0
LDI r2, 171
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
