; DESCRIPTION: Renders a white line between points (87, 154) and (38, 117).
; PLAN: r0=87(x1), r1=154(y1), r2=38(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 154
LDI r2, 38
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
