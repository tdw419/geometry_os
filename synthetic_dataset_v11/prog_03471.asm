; DESCRIPTION: Renders a white line between points (207, 91) and (163, 42).
; PLAN: r0=207(x1), r1=91(y1), r2=163(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 91
LDI r2, 163
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
