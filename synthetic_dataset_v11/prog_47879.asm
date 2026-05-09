; DESCRIPTION: Draws a green line from (41, 23) to (234, 71).
; PLAN: r0=41(x1), r1=23(y1), r2=234(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 23
LDI r2, 234
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
