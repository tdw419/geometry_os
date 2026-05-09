; DESCRIPTION: Draws a green line from (452, 101) to (209, 166).
; PLAN: r0=452(x1), r1=101(y1), r2=209(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 101
LDI r2, 209
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
