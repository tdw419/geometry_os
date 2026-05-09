; DESCRIPTION: Draws a yellow line from (68, 48) to (461, 171).
; PLAN: r0=68(x1), r1=48(y1), r2=461(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 48
LDI r2, 461
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
