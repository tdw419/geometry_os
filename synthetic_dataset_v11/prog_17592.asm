; DESCRIPTION: Draws a green line from (118, 149) to (170, 178).
; PLAN: r0=118(x1), r1=149(y1), r2=170(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 149
LDI r2, 170
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
