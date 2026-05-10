; DESCRIPTION: Renders a white line between points (339, 53) and (295, 2).
; PLAN: r0=339(x1), r1=53(y1), r2=295(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 53
LDI r2, 295
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
