; DESCRIPTION: Draws a black line from (171, 80) to (383, 135).
; PLAN: r0=171(x1), r1=80(y1), r2=383(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 80
LDI r2, 383
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
