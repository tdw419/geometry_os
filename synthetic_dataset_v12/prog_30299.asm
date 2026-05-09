; DESCRIPTION: Renders a black line between points (304, 27) and (287, 68).
; PLAN: r0=304(x1), r1=27(y1), r2=287(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 27
LDI r2, 287
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
