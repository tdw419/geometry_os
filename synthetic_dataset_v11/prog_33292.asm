; DESCRIPTION: Composite: . Then Draws a cyan line from (151, 94) to (137, 230). Then Renders a cyan disk with center (95, 184) and radius 70.
; PLAN: r0=151(x1), r1=94(y1), r2=137(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=184(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (151, 94) to (137, 230).
; PLAN: r0=151(x1), r1=94(y1), r2=137(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 94
LDI r2, 137
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (95, 184) and radius 70.
; PLAN: r0=95(x), r1=184(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 184
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
