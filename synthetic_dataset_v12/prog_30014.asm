; DESCRIPTION: Draws a magenta line from (494, 176) to (328, 41).
; PLAN: r0=494(x1), r1=176(y1), r2=328(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 176
LDI r2, 328
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
