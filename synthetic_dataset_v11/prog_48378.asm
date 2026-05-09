; DESCRIPTION: Draws a green line from (174, 121) to (161, 64).
; PLAN: r0=174(x1), r1=121(y1), r2=161(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 121
LDI r2, 161
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
