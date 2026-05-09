; DESCRIPTION: Draws a black line from (411, 172) to (113, 68).
; PLAN: r0=411(x1), r1=172(y1), r2=113(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 172
LDI r2, 113
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
