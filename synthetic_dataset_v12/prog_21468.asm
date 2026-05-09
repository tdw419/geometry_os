; DESCRIPTION: Renders a white line between points (482, 49) and (37, 171).
; PLAN: r0=482(x1), r1=49(y1), r2=37(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 49
LDI r2, 37
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
