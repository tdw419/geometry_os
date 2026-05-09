; DESCRIPTION: Places a purple 19x23 rectangle at position (405, 17).
; PLAN: r0=405(x), r1=17(y), r2=19(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 17
LDI r2, 19
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
