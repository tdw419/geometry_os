; DESCRIPTION: Draws a cyan line from (35, 207) to (116, 252).
; PLAN: r0=35(x1), r1=207(y1), r2=116(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 207
LDI r2, 116
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
