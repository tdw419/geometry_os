; DESCRIPTION: Places a purple 39x82 rectangle at position (381, 173).
; PLAN: r0=381(x), r1=173(y), r2=39(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 173
LDI r2, 39
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
