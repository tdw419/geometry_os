; DESCRIPTION: Draws a green line from (15, 43) to (241, 210).
; PLAN: r0=15(x1), r1=43(y1), r2=241(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 43
LDI r2, 241
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
