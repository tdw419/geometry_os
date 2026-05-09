; DESCRIPTION: Renders a cyan line between points (223, 39) and (287, 253).
; PLAN: r0=223(x1), r1=39(y1), r2=287(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 39
LDI r2, 287
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
