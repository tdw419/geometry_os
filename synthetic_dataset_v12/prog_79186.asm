; DESCRIPTION: Draws a cyan line from (483, 162) to (53, 202).
; PLAN: r0=483(x1), r1=162(y1), r2=53(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 162
LDI r2, 53
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
