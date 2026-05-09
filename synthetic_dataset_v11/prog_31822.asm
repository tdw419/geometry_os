; DESCRIPTION: Renders a white line between points (189, 117) and (150, 220).
; PLAN: r0=189(x1), r1=117(y1), r2=150(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 117
LDI r2, 150
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
