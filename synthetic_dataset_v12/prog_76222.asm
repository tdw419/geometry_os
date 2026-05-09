; DESCRIPTION: Renders a white line between points (105, 135) and (282, 192).
; PLAN: r0=105(x1), r1=135(y1), r2=282(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 135
LDI r2, 282
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
