; DESCRIPTION: Renders a white line between points (113, 96) and (509, 161).
; PLAN: r0=113(x1), r1=96(y1), r2=509(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 96
LDI r2, 509
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
