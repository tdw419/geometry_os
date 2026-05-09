; DESCRIPTION: Draws a red line from (98, 230) to (384, 25).
; PLAN: r0=98(x1), r1=230(y1), r2=384(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 230
LDI r2, 384
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
