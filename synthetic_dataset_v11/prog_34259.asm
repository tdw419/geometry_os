; DESCRIPTION: Renders a white line between points (82, 22) and (18, 172).
; PLAN: r0=82(x1), r1=22(y1), r2=18(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 22
LDI r2, 18
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
