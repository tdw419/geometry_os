; DESCRIPTION: Draws a red line from (109, 131) to (16, 177).
; PLAN: r0=109(x1), r1=131(y1), r2=16(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 131
LDI r2, 16
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
