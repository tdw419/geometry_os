; DESCRIPTION: Renders a white line between points (167, 2) and (8, 83).
; PLAN: r0=167(x1), r1=2(y1), r2=8(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 2
LDI r2, 8
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
