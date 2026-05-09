; DESCRIPTION: Composite: . Then Renders a red disk with center (154, 60) and radius 24. Then Renders a red line between points (14, 180) and (193, 224).
; PLAN: r0=154(x), r1=60(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=14(x1), r1=180(y1), r2=193(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (154, 60) and radius 24.
; PLAN: r0=154(x), r1=60(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 60
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (14, 180) and (193, 224).
; PLAN: r0=14(x1), r1=180(y1), r2=193(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 180
LDI r2, 193
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
