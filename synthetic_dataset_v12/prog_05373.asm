; DESCRIPTION: Draws a red line from (498, 144) to (214, 243).
; PLAN: r0=498(x1), r1=144(y1), r2=214(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 144
LDI r2, 214
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
