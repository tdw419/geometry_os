; DESCRIPTION: Draws a red line from (342, 71) to (305, 13).
; PLAN: r0=342(x1), r1=71(y1), r2=305(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 71
LDI r2, 305
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
