; DESCRIPTION: Draws a cyan line from (449, 148) to (232, 1).
; PLAN: r0=449(x1), r1=148(y1), r2=232(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 148
LDI r2, 232
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
