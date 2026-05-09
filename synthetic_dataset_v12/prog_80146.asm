; DESCRIPTION: Draws a green line from (50, 137) to (354, 41).
; PLAN: r0=50(x1), r1=137(y1), r2=354(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 137
LDI r2, 354
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
