; DESCRIPTION: Draws a yellow line from (121, 203) to (380, 193).
; PLAN: r0=121(x1), r1=203(y1), r2=380(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 203
LDI r2, 380
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
