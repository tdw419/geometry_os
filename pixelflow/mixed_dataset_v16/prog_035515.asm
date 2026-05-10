; DESCRIPTION: Draws a red line from (447, 108) to (410, 90).
; PLAN: r0=447(x1), r1=108(y1), r2=410(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 108
LDI r2, 410
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
