; DESCRIPTION: Draws a red line from (177, 103) to (122, 71).
; PLAN: r0=177(x1), r1=103(y1), r2=122(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 103
LDI r2, 122
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
