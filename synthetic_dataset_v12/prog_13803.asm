; DESCRIPTION: Draws a red line from (27, 245) to (483, 246).
; PLAN: r0=27(x1), r1=245(y1), r2=483(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 245
LDI r2, 483
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
