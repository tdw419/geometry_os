; DESCRIPTION: Renders a white line between points (164, 235) and (61, 57).
; PLAN: r0=164(x1), r1=235(y1), r2=61(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 235
LDI r2, 61
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
