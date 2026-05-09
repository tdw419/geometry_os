; DESCRIPTION: Renders a yellow line between points (197, 5) and (182, 46).
; PLAN: r0=197(x1), r1=5(y1), r2=182(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 5
LDI r2, 182
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
