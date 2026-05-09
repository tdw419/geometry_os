; DESCRIPTION: Draws a red line from (228, 147) to (456, 243).
; PLAN: r0=228(x1), r1=147(y1), r2=456(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 147
LDI r2, 456
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
