; DESCRIPTION: Draws a green line from (443, 202) to (131, 138).
; PLAN: r0=443(x1), r1=202(y1), r2=131(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 202
LDI r2, 131
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
