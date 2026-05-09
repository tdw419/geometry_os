; DESCRIPTION: Draws a red line from (14, 45) to (21, 249).
; PLAN: r0=14(x1), r1=45(y1), r2=21(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 45
LDI r2, 21
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
