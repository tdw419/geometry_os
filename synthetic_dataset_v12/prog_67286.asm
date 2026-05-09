; DESCRIPTION: Renders a black line between points (386, 114) and (271, 165).
; PLAN: r0=386(x1), r1=114(y1), r2=271(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 114
LDI r2, 271
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
