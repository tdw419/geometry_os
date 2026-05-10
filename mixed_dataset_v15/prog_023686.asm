; DESCRIPTION: Draws a cyan line from (449, 116) to (452, 138).
; PLAN: r0=449(x1), r1=116(y1), r2=452(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 116
LDI r2, 452
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
