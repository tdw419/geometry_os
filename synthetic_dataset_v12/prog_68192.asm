; DESCRIPTION: Renders a white line between points (104, 42) and (207, 120).
; PLAN: r0=104(x1), r1=42(y1), r2=207(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 42
LDI r2, 207
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
