; DESCRIPTION: Draws a yellow line from (365, 245) to (468, 54).
; PLAN: r0=365(x1), r1=245(y1), r2=468(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 245
LDI r2, 468
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
