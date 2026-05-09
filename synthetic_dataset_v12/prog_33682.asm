; DESCRIPTION: Renders a black line between points (372, 124) and (386, 98).
; PLAN: r0=372(x1), r1=124(y1), r2=386(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 124
LDI r2, 386
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
