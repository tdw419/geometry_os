; DESCRIPTION: Places a purple 107x111 rectangle at position (399, 72).
; PLAN: r0=399(x), r1=72(y), r2=107(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 72
LDI r2, 107
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
