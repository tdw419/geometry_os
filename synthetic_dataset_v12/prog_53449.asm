; DESCRIPTION: Renders a white line between points (227, 196) and (498, 42).
; PLAN: r0=227(x1), r1=196(y1), r2=498(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 196
LDI r2, 498
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
