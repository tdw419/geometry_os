; DESCRIPTION: Renders a white line between points (125, 126) and (61, 120).
; PLAN: r0=125(x1), r1=126(y1), r2=61(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 126
LDI r2, 61
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
