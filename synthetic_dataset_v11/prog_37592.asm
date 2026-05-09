; DESCRIPTION: Composite: . Then Places a red 92x57 rectangle at position (120, 57). Then Places a purple circle of radius 67 at center (172, 133).
; PLAN: r0=120(x), r1=57(y), r2=92(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=172(x), r1=133(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 92x57 rectangle at position (120, 57).
; PLAN: r0=120(x), r1=57(y), r2=92(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 92
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 67 at center (172, 133).
; PLAN: r0=172(x), r1=133(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 133
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
