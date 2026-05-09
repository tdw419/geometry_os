; DESCRIPTION: Draws a orange line from (58, 154) to (197, 167).
; PLAN: r0=58(x1), r1=154(y1), r2=197(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 154
LDI r2, 197
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
