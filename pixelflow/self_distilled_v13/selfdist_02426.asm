; DESCRIPTION: Draws a magenta line from (52, 135) to (333, 41).
; PLAN: r0=52(x1), r1=135(y1), r2=333(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 135
LDI r2, 333
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
