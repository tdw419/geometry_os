; DESCRIPTION: Draws a red line from (42, 134) to (322, 88).
; PLAN: r0=42(x1), r1=134(y1), r2=322(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 134
LDI r2, 322
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
