; DESCRIPTION: Composite: . Then Places a magenta 112x53 rectangle at position (94, 36). Then Renders a blue disk with center (140, 169) and radius 70.
; PLAN: r0=94(x), r1=36(y), r2=112(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=169(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 112x53 rectangle at position (94, 36).
; PLAN: r0=94(x), r1=36(y), r2=112(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 36
LDI r2, 112
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (140, 169) and radius 70.
; PLAN: r0=140(x), r1=169(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 169
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
