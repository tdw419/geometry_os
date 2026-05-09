; DESCRIPTION: Draws a green line from (111, 212) to (86, 90).
; PLAN: r0=111(x1), r1=212(y1), r2=86(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 212
LDI r2, 86
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
