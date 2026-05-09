; DESCRIPTION: Renders a cyan line between points (5, 97) and (85, 68).
; PLAN: r0=5(x1), r1=97(y1), r2=85(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 97
LDI r2, 85
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
