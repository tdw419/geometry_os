; DESCRIPTION: Draws a red line from (449, 27) to (418, 35).
; PLAN: r0=449(x1), r1=27(y1), r2=418(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 27
LDI r2, 418
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
