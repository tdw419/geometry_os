; DESCRIPTION: Draws a green line from (23, 41) to (321, 125).
; PLAN: r0=23(x1), r1=41(y1), r2=321(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 41
LDI r2, 321
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
