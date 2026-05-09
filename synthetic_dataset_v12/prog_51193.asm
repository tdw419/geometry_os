; DESCRIPTION: Draws a cyan line from (81, 116) to (158, 167).
; PLAN: r0=81(x1), r1=116(y1), r2=158(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 116
LDI r2, 158
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
