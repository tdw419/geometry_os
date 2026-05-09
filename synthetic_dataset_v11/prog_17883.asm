; DESCRIPTION: Draws a green line from (208, 10) to (68, 190).
; PLAN: r0=208(x1), r1=10(y1), r2=68(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 10
LDI r2, 68
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
