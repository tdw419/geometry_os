; DESCRIPTION: Renders a white line between points (140, 150) and (184, 164).
; PLAN: r0=140(x1), r1=150(y1), r2=184(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 150
LDI r2, 184
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
