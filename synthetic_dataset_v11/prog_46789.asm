; DESCRIPTION: Draws a cyan line from (153, 26) to (149, 115).
; PLAN: r0=153(x1), r1=26(y1), r2=149(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 26
LDI r2, 149
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
