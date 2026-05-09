; DESCRIPTION: Renders a cyan line between points (109, 117) and (150, 91).
; PLAN: r0=109(x1), r1=117(y1), r2=150(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 117
LDI r2, 150
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
