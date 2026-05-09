; DESCRIPTION: Draws a green line from (64, 40) to (443, 165).
; PLAN: r0=64(x1), r1=40(y1), r2=443(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 40
LDI r2, 443
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
