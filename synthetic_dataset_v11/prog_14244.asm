; DESCRIPTION: Composite: . Then Places a blue 31x50 rectangle at position (103, 189). Then Places a red circle of radius 77 at center (111, 94).
; PLAN: r0=103(x), r1=189(y), r2=31(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=94(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 31x50 rectangle at position (103, 189).
; PLAN: r0=103(x), r1=189(y), r2=31(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 189
LDI r2, 31
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 77 at center (111, 94).
; PLAN: r0=111(x), r1=94(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 94
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
