; DESCRIPTION: Draws a cyan line from (114, 212) to (167, 74).
; PLAN: r0=114(x1), r1=212(y1), r2=167(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 212
LDI r2, 167
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
