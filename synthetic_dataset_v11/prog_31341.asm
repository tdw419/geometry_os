; DESCRIPTION: Composite: . Then Places a purple circle of radius 63 at center (142, 165). Then Renders a cyan box of size 36x94 starting at (85, 32).
; PLAN: r0=142(x), r1=165(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=85(x), r1=32(y), r2=36(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 63 at center (142, 165).
; PLAN: r0=142(x), r1=165(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 165
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 36x94 starting at (85, 32).
; PLAN: r0=85(x), r1=32(y), r2=36(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 32
LDI r2, 36
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
