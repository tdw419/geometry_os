; DESCRIPTION: Renders a yellow line between points (60, 73) and (165, 182).
; PLAN: r0=60(x1), r1=73(y1), r2=165(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 73
LDI r2, 165
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
