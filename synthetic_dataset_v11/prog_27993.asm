; DESCRIPTION: Renders a white line between points (197, 205) and (14, 158).
; PLAN: r0=197(x1), r1=205(y1), r2=14(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 205
LDI r2, 14
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
