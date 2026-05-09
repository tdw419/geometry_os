; DESCRIPTION: Draws a cyan line from (49, 117) to (167, 131).
; PLAN: r0=49(x1), r1=117(y1), r2=167(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 117
LDI r2, 167
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
