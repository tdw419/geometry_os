; DESCRIPTION: Draws a red line from (39, 194) to (12, 173).
; PLAN: r0=39(x1), r1=194(y1), r2=12(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 194
LDI r2, 12
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
