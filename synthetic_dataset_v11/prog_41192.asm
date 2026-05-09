; DESCRIPTION: Renders a white line between points (86, 116) and (127, 32).
; PLAN: r0=86(x1), r1=116(y1), r2=127(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 116
LDI r2, 127
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
