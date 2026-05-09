; DESCRIPTION: Composite: . Then Renders a green line between points (83, 96) and (247, 104). Then Renders a magenta disk with center (95, 96) and radius 15.
; PLAN: r0=83(x1), r1=96(y1), r2=247(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=96(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (83, 96) and (247, 104).
; PLAN: r0=83(x1), r1=96(y1), r2=247(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 96
LDI r2, 247
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (95, 96) and radius 15.
; PLAN: r0=95(x), r1=96(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 96
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
