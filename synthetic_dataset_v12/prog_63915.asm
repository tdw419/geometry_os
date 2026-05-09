; DESCRIPTION: Renders a white line between points (74, 197) and (92, 70).
; PLAN: r0=74(x1), r1=197(y1), r2=92(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 197
LDI r2, 92
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
