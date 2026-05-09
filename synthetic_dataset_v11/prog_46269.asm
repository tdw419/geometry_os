; DESCRIPTION: Composite: . Then Places a blue circle of radius 63 at center (186, 89). Then Places a white 114x98 rectangle at position (7, 85).
; PLAN: r0=186(x), r1=89(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=7(x), r1=85(y), r2=114(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 63 at center (186, 89).
; PLAN: r0=186(x), r1=89(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 89
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 114x98 rectangle at position (7, 85).
; PLAN: r0=7(x), r1=85(y), r2=114(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 85
LDI r2, 114
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
