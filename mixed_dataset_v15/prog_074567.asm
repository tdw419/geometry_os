; DESCRIPTION: Renders a purple box of size 30x113 starting at (354, 20).
; PLAN: r0=354(x), r1=20(y), r2=30(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 20
LDI r2, 30
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
