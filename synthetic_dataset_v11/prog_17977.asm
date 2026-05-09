; DESCRIPTION: Renders a red line between points (182, 206) and (212, 36).
; PLAN: r0=182(x1), r1=206(y1), r2=212(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 206
LDI r2, 212
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
