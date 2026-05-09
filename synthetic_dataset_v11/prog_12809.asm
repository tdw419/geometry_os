; DESCRIPTION: Places a purple 20x107 rectangle at position (111, 71).
; PLAN: r0=111(x), r1=71(y), r2=20(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 71
LDI r2, 20
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
