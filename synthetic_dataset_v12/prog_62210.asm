; DESCRIPTION: Draws a yellow line from (215, 72) to (461, 193).
; PLAN: r0=215(x1), r1=72(y1), r2=461(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 72
LDI r2, 461
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
