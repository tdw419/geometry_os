; DESCRIPTION: Draws a black line from (405, 41) to (193, 166).
; PLAN: r0=405(x1), r1=41(y1), r2=193(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 41
LDI r2, 193
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
