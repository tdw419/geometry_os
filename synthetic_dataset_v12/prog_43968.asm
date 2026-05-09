; DESCRIPTION: Renders a black line between points (113, 60) and (46, 233).
; PLAN: r0=113(x1), r1=60(y1), r2=46(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 60
LDI r2, 46
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
