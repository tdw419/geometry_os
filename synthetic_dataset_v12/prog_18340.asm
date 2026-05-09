; DESCRIPTION: Renders a white line between points (86, 153) and (23, 117).
; PLAN: r0=86(x1), r1=153(y1), r2=23(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 153
LDI r2, 23
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
