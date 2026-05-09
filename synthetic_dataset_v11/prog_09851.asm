; DESCRIPTION: Composite: . Then Renders a purple line between points (30, 235) and (18, 216). Then Places a yellow 83x120 rectangle at position (45, 93).
; PLAN: r0=30(x1), r1=235(y1), r2=18(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=93(y), r2=83(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (30, 235) and (18, 216).
; PLAN: r0=30(x1), r1=235(y1), r2=18(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 235
LDI r2, 18
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 83x120 rectangle at position (45, 93).
; PLAN: r0=45(x), r1=93(y), r2=83(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 93
LDI r2, 83
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
