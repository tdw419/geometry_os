; DESCRIPTION: Renders a black line between points (233, 221) and (260, 134).
; PLAN: r0=233(x1), r1=221(y1), r2=260(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 221
LDI r2, 260
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
