; DESCRIPTION: Renders a white line between points (252, 74) and (117, 248).
; PLAN: r0=252(x1), r1=74(y1), r2=117(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 74
LDI r2, 117
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
