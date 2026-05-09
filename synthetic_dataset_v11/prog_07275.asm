; DESCRIPTION: Composite: . Then Renders a purple disk with center (40, 51) and radius 19. Then Places a white 30x10 rectangle at position (1, 127).
; PLAN: r0=40(x), r1=51(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x), r1=127(y), r2=30(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (40, 51) and radius 19.
; PLAN: r0=40(x), r1=51(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 51
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 30x10 rectangle at position (1, 127).
; PLAN: r0=1(x), r1=127(y), r2=30(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 127
LDI r2, 30
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
