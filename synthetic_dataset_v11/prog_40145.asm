; DESCRIPTION: Draws a yellow line from (126, 28) to (116, 55).
; PLAN: r0=126(x1), r1=28(y1), r2=116(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 28
LDI r2, 116
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
