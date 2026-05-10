; DESCRIPTION: Draws a green line from (452, 49) to (481, 21).
; PLAN: r0=452(x1), r1=49(y1), r2=481(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 49
LDI r2, 481
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
