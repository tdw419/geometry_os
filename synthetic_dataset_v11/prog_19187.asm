; DESCRIPTION: Renders a black line between points (113, 71) and (58, 95).
; PLAN: r0=113(x1), r1=71(y1), r2=58(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 71
LDI r2, 58
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
