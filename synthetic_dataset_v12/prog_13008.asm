; DESCRIPTION: Draws a green line from (494, 115) to (170, 9).
; PLAN: r0=494(x1), r1=115(y1), r2=170(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 115
LDI r2, 170
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
