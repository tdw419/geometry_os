; DESCRIPTION: Draws a red line from (480, 208) to (419, 186).
; PLAN: r0=480(x1), r1=208(y1), r2=419(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 208
LDI r2, 419
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
