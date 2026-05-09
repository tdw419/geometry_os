; DESCRIPTION: Composite: . Then Renders a red line between points (75, 79) and (184, 6). Then Renders a yellow disk with center (180, 74) and radius 35.
; PLAN: r0=75(x1), r1=79(y1), r2=184(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=74(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (75, 79) and (184, 6).
; PLAN: r0=75(x1), r1=79(y1), r2=184(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 79
LDI r2, 184
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (180, 74) and radius 35.
; PLAN: r0=180(x), r1=74(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 74
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
