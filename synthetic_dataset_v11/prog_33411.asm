; DESCRIPTION: Composite: . Then Sets a single green pixel at (106, 21). Then Renders a orange line between points (67, 52) and (80, 50).
; PLAN: r0=106(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=67(x1), r1=52(y1), r2=80(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (106, 21).
; PLAN: r0=106(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 21
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (67, 52) and (80, 50).
; PLAN: r0=67(x1), r1=52(y1), r2=80(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 52
LDI r2, 80
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
