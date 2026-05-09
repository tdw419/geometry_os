; DESCRIPTION: Draws a red line from (413, 215) to (325, 98).
; PLAN: r0=413(x1), r1=215(y1), r2=325(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 215
LDI r2, 325
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
