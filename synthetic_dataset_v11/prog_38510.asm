; DESCRIPTION: Composite: . Then Places a white 59x37 rectangle at position (166, 201). Then Places a yellow circle of radius 73 at center (94, 169).
; PLAN: r0=166(x), r1=201(y), r2=59(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x), r1=169(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 59x37 rectangle at position (166, 201).
; PLAN: r0=166(x), r1=201(y), r2=59(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 201
LDI r2, 59
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 73 at center (94, 169).
; PLAN: r0=94(x), r1=169(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 169
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
