; DESCRIPTION: Renders a white line between points (42, 124) and (273, 102).
; PLAN: r0=42(x1), r1=124(y1), r2=273(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 124
LDI r2, 273
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
