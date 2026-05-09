; DESCRIPTION: Draws a cyan line from (193, 198) to (452, 2).
; PLAN: r0=193(x1), r1=198(y1), r2=452(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 198
LDI r2, 452
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
