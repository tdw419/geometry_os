; DESCRIPTION: Draws a red line from (208, 220) to (247, 14).
; PLAN: r0=208(x1), r1=220(y1), r2=247(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 220
LDI r2, 247
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
