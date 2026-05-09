; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (94, 51) spanning 80 by 93 pixels. Then Renders a green disk with center (87, 107) and radius 66.
; PLAN: r0=94(x), r1=51(y), r2=80(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=107(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (94, 51) spanning 80 by 93 pixels.
; PLAN: r0=94(x), r1=51(y), r2=80(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 51
LDI r2, 80
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (87, 107) and radius 66.
; PLAN: r0=87(x), r1=107(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 107
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
