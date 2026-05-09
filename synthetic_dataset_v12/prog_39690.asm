; DESCRIPTION: Draws a red line from (199, 226) to (339, 21).
; PLAN: r0=199(x1), r1=226(y1), r2=339(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 226
LDI r2, 339
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
