; DESCRIPTION: Draws a white line from (95, 18) to (306, 171).
; PLAN: r0=95(x1), r1=18(y1), r2=306(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 18
LDI r2, 306
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
