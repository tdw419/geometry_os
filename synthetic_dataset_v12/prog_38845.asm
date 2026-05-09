; DESCRIPTION: Draws a yellow line from (437, 204) to (446, 127).
; PLAN: r0=437(x1), r1=204(y1), r2=446(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 204
LDI r2, 446
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
