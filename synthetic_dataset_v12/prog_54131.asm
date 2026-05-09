; DESCRIPTION: Draws a cyan line from (81, 252) to (511, 162).
; PLAN: r0=81(x1), r1=252(y1), r2=511(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 252
LDI r2, 511
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
