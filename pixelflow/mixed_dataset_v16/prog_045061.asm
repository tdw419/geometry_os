; DESCRIPTION: Renders a white line between points (177, 32) and (28, 123).
; PLAN: r0=177(x1), r1=32(y1), r2=28(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 32
LDI r2, 28
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
