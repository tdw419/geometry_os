; DESCRIPTION: Renders a white line between points (175, 102) and (197, 53).
; PLAN: r0=175(x1), r1=102(y1), r2=197(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 102
LDI r2, 197
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
