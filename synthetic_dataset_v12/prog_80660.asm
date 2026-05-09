; DESCRIPTION: Draws a green line from (73, 135) to (187, 181).
; PLAN: r0=73(x1), r1=135(y1), r2=187(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 135
LDI r2, 187
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
