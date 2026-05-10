; DESCRIPTION: Renders a white line between points (386, 183) and (505, 1).
; PLAN: r0=386(x1), r1=183(y1), r2=505(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 183
LDI r2, 505
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
