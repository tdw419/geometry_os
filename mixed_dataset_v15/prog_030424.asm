; DESCRIPTION: Draws a orange line from (445, 91) to (488, 118).
; PLAN: r0=445(x1), r1=91(y1), r2=488(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 91
LDI r2, 488
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
