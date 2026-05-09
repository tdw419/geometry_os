; DESCRIPTION: Draws a red line from (247, 117) to (131, 50).
; PLAN: r0=247(x1), r1=117(y1), r2=131(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 117
LDI r2, 131
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
