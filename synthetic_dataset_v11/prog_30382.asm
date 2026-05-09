; DESCRIPTION: Renders a cyan line between points (109, 24) and (33, 91).
; PLAN: r0=109(x1), r1=24(y1), r2=33(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 33
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
