; DESCRIPTION: Draws a cyan line from (100, 155) to (148, 234).
; PLAN: r0=100(x1), r1=155(y1), r2=148(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 155
LDI r2, 148
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
