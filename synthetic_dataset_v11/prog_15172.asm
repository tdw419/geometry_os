; DESCRIPTION: Draws a red line from (24, 215) to (7, 222).
; PLAN: r0=24(x1), r1=215(y1), r2=7(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 215
LDI r2, 7
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
