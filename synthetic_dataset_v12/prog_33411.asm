; DESCRIPTION: Draws a green line from (121, 24) to (168, 46).
; PLAN: r0=121(x1), r1=24(y1), r2=168(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 24
LDI r2, 168
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
