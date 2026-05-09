; DESCRIPTION: Draws a cyan line from (216, 214) to (155, 95).
; PLAN: r0=216(x1), r1=214(y1), r2=155(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 214
LDI r2, 155
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
