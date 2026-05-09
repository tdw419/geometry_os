; DESCRIPTION: Draws a red line from (215, 50) to (185, 186).
; PLAN: r0=215(x1), r1=50(y1), r2=185(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 50
LDI r2, 185
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
