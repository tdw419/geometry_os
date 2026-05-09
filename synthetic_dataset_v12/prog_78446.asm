; DESCRIPTION: Renders a white line between points (70, 238) and (418, 153).
; PLAN: r0=70(x1), r1=238(y1), r2=418(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 238
LDI r2, 418
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
