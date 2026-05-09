; DESCRIPTION: Draws a red line from (286, 245) to (468, 14).
; PLAN: r0=286(x1), r1=245(y1), r2=468(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 245
LDI r2, 468
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
