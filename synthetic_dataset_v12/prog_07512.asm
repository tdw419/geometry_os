; DESCRIPTION: Draws a green line from (84, 161) to (386, 217).
; PLAN: r0=84(x1), r1=161(y1), r2=386(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 161
LDI r2, 386
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
