; DESCRIPTION: Renders a black line between points (38, 39) and (154, 165).
; PLAN: r0=38(x1), r1=39(y1), r2=154(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 39
LDI r2, 154
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
