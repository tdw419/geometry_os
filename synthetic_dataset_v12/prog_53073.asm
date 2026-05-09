; DESCRIPTION: Renders a white line between points (157, 85) and (370, 103).
; PLAN: r0=157(x1), r1=85(y1), r2=370(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 85
LDI r2, 370
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
