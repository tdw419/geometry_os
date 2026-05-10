; DESCRIPTION: Draws a cyan line from (99, 100) to (30, 181).
; PLAN: r0=99(x1), r1=100(y1), r2=30(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 100
LDI r2, 30
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
