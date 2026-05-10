; DESCRIPTION: Draws a green line from (449, 32) to (65, 41).
; PLAN: r0=449(x1), r1=32(y1), r2=65(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 32
LDI r2, 65
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
