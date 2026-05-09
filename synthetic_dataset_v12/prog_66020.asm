; DESCRIPTION: Draws a green line from (468, 106) to (52, 173).
; PLAN: r0=468(x1), r1=106(y1), r2=52(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 106
LDI r2, 52
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
