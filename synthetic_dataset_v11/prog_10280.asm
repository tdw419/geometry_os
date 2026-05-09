; DESCRIPTION: Composite: . Then Renders a blue line between points (39, 93) and (235, 74). Then Creates a cyan circular shape at (166, 78) with radius 60.
; PLAN: r0=39(x1), r1=93(y1), r2=235(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=78(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (39, 93) and (235, 74).
; PLAN: r0=39(x1), r1=93(y1), r2=235(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 93
LDI r2, 235
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (166, 78) with radius 60.
; PLAN: r0=166(x), r1=78(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 78
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
