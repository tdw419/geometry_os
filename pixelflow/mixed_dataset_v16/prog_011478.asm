; DESCRIPTION: Draws a cyan line from (138, 137) to (389, 66).
; PLAN: r0=138(x1), r1=137(y1), r2=389(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 137
LDI r2, 389
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
