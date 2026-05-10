; DESCRIPTION: Draws a magenta line from (285, 197) to (303, 41).
; PLAN: r0=285(x1), r1=197(y1), r2=303(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 197
LDI r2, 303
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
