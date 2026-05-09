; DESCRIPTION: Draws a red line from (486, 27) to (261, 24).
; PLAN: r0=486(x1), r1=27(y1), r2=261(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 27
LDI r2, 261
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
