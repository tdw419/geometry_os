; DESCRIPTION: Composite: . Then Places a blue 12x94 rectangle at position (33, 120). Then Sets a single yellow pixel at (165, 129).
; PLAN: r0=33(x), r1=120(y), r2=12(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 12x94 rectangle at position (33, 120).
; PLAN: r0=33(x), r1=120(y), r2=12(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 120
LDI r2, 12
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (165, 129).
; PLAN: r0=165(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
