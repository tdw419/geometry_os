; DESCRIPTION: Places a red line segment connecting (447, 191) to (187, 103).
; PLAN: r0=447(x1), r1=191(y1), r2=187(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 191
LDI r2, 187
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
