; DESCRIPTION: Renders a white line between points (95, 68) and (32, 61).
; PLAN: r0=95(x1), r1=68(y1), r2=32(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 68
LDI r2, 32
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
