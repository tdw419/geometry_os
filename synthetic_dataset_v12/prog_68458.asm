; DESCRIPTION: Draws a green line from (98, 95) to (13, 198).
; PLAN: r0=98(x1), r1=95(y1), r2=13(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 95
LDI r2, 13
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
