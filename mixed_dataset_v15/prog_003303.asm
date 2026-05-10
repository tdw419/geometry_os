; DESCRIPTION: Renders a white line between points (161, 140) and (437, 42).
; PLAN: r0=161(x1), r1=140(y1), r2=437(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 140
LDI r2, 437
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
