; DESCRIPTION: Draws a red line from (124, 254) to (380, 254).
; PLAN: r0=124(x1), r1=254(y1), r2=380(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 254
LDI r2, 380
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
