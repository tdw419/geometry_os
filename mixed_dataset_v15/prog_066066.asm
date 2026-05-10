; DESCRIPTION: Renders a white line between points (48, 200) and (113, 56).
; PLAN: r0=48(x1), r1=200(y1), r2=113(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 200
LDI r2, 113
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
