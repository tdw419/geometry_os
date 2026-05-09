; DESCRIPTION: Renders a white line between points (504, 98) and (299, 53).
; PLAN: r0=504(x1), r1=98(y1), r2=299(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 98
LDI r2, 299
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
