; DESCRIPTION: Renders a white line between points (60, 205) and (157, 34).
; PLAN: r0=60(x1), r1=205(y1), r2=157(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 205
LDI r2, 157
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
