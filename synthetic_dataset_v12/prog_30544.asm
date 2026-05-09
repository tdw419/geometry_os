; DESCRIPTION: Renders a white line between points (117, 27) and (200, 69).
; PLAN: r0=117(x1), r1=27(y1), r2=200(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 27
LDI r2, 200
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
