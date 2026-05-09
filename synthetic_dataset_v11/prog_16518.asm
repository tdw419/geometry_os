; DESCRIPTION: Renders a white line between points (222, 60) and (210, 28).
; PLAN: r0=222(x1), r1=60(y1), r2=210(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 60
LDI r2, 210
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
