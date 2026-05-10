; DESCRIPTION: Draws a red line from (245, 74) to (365, 222).
; PLAN: r0=245(x1), r1=74(y1), r2=365(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 74
LDI r2, 365
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
