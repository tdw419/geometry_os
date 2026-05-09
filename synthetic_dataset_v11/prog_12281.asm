; DESCRIPTION: Draws a red line from (45, 237) to (140, 240).
; PLAN: r0=45(x1), r1=237(y1), r2=140(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 237
LDI r2, 140
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
