; DESCRIPTION: Draws a cyan line from (200, 166) to (292, 97).
; PLAN: r0=200(x1), r1=166(y1), r2=292(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 166
LDI r2, 292
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
