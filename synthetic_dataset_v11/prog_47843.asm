; DESCRIPTION: Renders a white line between points (141, 83) and (197, 132).
; PLAN: r0=141(x1), r1=83(y1), r2=197(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 83
LDI r2, 197
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
