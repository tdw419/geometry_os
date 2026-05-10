; DESCRIPTION: Draws a cyan line from (100, 174) to (200, 101).
; PLAN: r0=100(x1), r1=174(y1), r2=200(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 174
LDI r2, 200
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
