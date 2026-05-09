; DESCRIPTION: Draws a red line from (58, 209) to (98, 4).
; PLAN: r0=58(x1), r1=209(y1), r2=98(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 209
LDI r2, 98
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
