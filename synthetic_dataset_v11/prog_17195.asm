; DESCRIPTION: Composite: . Then Creates a blue circular shape at (126, 74) with radius 66. Then Places a cyan line segment connecting (255, 182) to (92, 107).
; PLAN: r0=126(x), r1=74(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=255(x1), r1=182(y1), r2=92(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (126, 74) with radius 66.
; PLAN: r0=126(x), r1=74(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 74
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (255, 182) to (92, 107).
; PLAN: r0=255(x1), r1=182(y1), r2=92(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 182
LDI r2, 92
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
