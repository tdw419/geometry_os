; DESCRIPTION: Draws a cyan line from (138, 131) to (49, 186).
; PLAN: r0=138(x1), r1=131(y1), r2=49(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 131
LDI r2, 49
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
