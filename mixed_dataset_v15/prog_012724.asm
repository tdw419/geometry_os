; DESCRIPTION: Draws a orange line from (333, 91) to (120, 134).
; PLAN: r0=333(x1), r1=91(y1), r2=120(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 91
LDI r2, 120
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
