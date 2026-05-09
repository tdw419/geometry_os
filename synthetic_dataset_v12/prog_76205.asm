; DESCRIPTION: Draws a cyan line from (63, 102) to (139, 72).
; PLAN: r0=63(x1), r1=102(y1), r2=139(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 102
LDI r2, 139
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
