; DESCRIPTION: Draws a cyan line from (497, 114) to (311, 119).
; PLAN: r0=497(x1), r1=114(y1), r2=311(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 114
LDI r2, 311
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
