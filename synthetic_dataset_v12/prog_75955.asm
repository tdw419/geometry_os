; DESCRIPTION: Draws a green line from (118, 75) to (209, 107).
; PLAN: r0=118(x1), r1=75(y1), r2=209(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 75
LDI r2, 209
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
