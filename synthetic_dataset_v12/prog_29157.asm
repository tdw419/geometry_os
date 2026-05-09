; DESCRIPTION: Renders a green line between points (2, 213) and (189, 53).
; PLAN: r0=2(x1), r1=213(y1), r2=189(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 213
LDI r2, 189
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
