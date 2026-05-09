; DESCRIPTION: Renders a white line between points (166, 161) and (126, 91).
; PLAN: r0=166(x1), r1=161(y1), r2=126(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 161
LDI r2, 126
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
