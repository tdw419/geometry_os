; DESCRIPTION: Composite: . Then Renders a purple disk with center (131, 116) and radius 77. Then Places a cyan line segment connecting (32, 71) to (12, 68).
; PLAN: r0=131(x), r1=116(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x1), r1=71(y1), r2=12(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (131, 116) and radius 77.
; PLAN: r0=131(x), r1=116(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 116
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (32, 71) to (12, 68).
; PLAN: r0=32(x1), r1=71(y1), r2=12(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 71
LDI r2, 12
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
