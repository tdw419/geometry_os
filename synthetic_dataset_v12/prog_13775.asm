; DESCRIPTION: Renders a white line between points (287, 11) and (365, 171).
; PLAN: r0=287(x1), r1=11(y1), r2=365(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 11
LDI r2, 365
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
