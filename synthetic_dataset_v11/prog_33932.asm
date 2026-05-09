; DESCRIPTION: Renders a white line between points (144, 171) and (86, 184).
; PLAN: r0=144(x1), r1=171(y1), r2=86(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 171
LDI r2, 86
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
