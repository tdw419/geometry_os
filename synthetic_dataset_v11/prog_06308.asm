; DESCRIPTION: Renders a white line between points (100, 105) and (115, 213).
; PLAN: r0=100(x1), r1=105(y1), r2=115(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 105
LDI r2, 115
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
