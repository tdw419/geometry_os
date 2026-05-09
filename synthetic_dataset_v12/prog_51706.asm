; DESCRIPTION: Draws a red line from (455, 138) to (311, 69).
; PLAN: r0=455(x1), r1=138(y1), r2=311(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 138
LDI r2, 311
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
