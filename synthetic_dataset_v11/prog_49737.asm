; DESCRIPTION: Draws a cyan line from (116, 101) to (53, 12).
; PLAN: r0=116(x1), r1=101(y1), r2=53(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 101
LDI r2, 53
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
