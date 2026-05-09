; DESCRIPTION: Renders a blue line between points (384, 187) and (52, 82).
; PLAN: r0=384(x1), r1=187(y1), r2=52(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 187
LDI r2, 52
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
