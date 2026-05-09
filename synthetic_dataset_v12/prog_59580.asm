; DESCRIPTION: Draws a green line from (258, 202) to (107, 138).
; PLAN: r0=258(x1), r1=202(y1), r2=107(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 202
LDI r2, 107
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
