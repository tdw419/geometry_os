; DESCRIPTION: Renders a white line between points (154, 87) and (101, 142).
; PLAN: r0=154(x1), r1=87(y1), r2=101(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 87
LDI r2, 101
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
