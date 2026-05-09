; DESCRIPTION: Composite: . Then Creates a purple circular shape at (179, 65) with radius 48. Then Renders a red line between points (50, 165) and (221, 24).
; PLAN: r0=179(x), r1=65(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x1), r1=165(y1), r2=221(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (179, 65) with radius 48.
; PLAN: r0=179(x), r1=65(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 65
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (50, 165) and (221, 24).
; PLAN: r0=50(x1), r1=165(y1), r2=221(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 165
LDI r2, 221
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
