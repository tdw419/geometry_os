; DESCRIPTION: Draws a yellow line from (467, 202) to (241, 96).
; PLAN: r0=467(x1), r1=202(y1), r2=241(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 202
LDI r2, 241
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
