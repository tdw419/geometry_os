; DESCRIPTION: Places a purple 39x49 rectangle at position (109, 144).
; PLAN: r0=109(x), r1=144(y), r2=39(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 144
LDI r2, 39
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
