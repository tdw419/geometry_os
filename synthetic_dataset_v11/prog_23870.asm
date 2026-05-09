; DESCRIPTION: Renders a white line between points (39, 171) and (103, 105).
; PLAN: r0=39(x1), r1=171(y1), r2=103(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 171
LDI r2, 103
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
