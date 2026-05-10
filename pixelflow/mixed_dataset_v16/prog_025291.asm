; DESCRIPTION: Draws a cyan line from (140, 149) to (76, 137).
; PLAN: r0=140(x1), r1=149(y1), r2=76(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 149
LDI r2, 76
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
