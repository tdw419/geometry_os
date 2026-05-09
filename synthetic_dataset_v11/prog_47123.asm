; DESCRIPTION: Places a purple 19x111 rectangle at position (151, 7).
; PLAN: r0=151(x), r1=7(y), r2=19(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 7
LDI r2, 19
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
