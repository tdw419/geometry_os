; DESCRIPTION: Renders a white line between points (42, 101) and (108, 1).
; PLAN: r0=42(x1), r1=101(y1), r2=108(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 101
LDI r2, 108
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
