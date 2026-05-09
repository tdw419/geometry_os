; DESCRIPTION: Draws a white line from (154, 72) to (51, 41).
; PLAN: r0=154(x1), r1=72(y1), r2=51(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 72
LDI r2, 51
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
