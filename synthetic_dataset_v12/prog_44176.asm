; DESCRIPTION: Renders a purple line between points (197, 42) and (467, 5).
; PLAN: r0=197(x1), r1=42(y1), r2=467(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 42
LDI r2, 467
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
