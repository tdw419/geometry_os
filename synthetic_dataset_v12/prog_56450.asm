; DESCRIPTION: Draws a green line from (187, 11) to (511, 43).
; PLAN: r0=187(x1), r1=11(y1), r2=511(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 11
LDI r2, 511
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
