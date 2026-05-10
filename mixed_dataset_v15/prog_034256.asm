; DESCRIPTION: Renders a white line between points (164, 202) and (25, 163).
; PLAN: r0=164(x1), r1=202(y1), r2=25(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 202
LDI r2, 25
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
