; DESCRIPTION: Renders a white line between points (172, 168) and (42, 175).
; PLAN: r0=172(x1), r1=168(y1), r2=42(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 168
LDI r2, 42
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
