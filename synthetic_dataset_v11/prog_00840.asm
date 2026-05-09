; DESCRIPTION: Composite: . Then Places a purple dot at position (94, 116). Then Renders a black box of size 30x111 starting at (184, 84).
; PLAN: r0=94(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=84(y), r2=30(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (94, 116).
; PLAN: r0=94(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 30x111 starting at (184, 84).
; PLAN: r0=184(x), r1=84(y), r2=30(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 84
LDI r2, 30
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
