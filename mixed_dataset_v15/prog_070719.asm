; DESCRIPTION: Draws a red line from (240, 64) to (411, 72).
; PLAN: r0=240(x1), r1=64(y1), r2=411(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 64
LDI r2, 411
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
