; DESCRIPTION: Draws a green line from (355, 149) to (241, 198).
; PLAN: r0=355(x1), r1=149(y1), r2=241(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 149
LDI r2, 241
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
