; DESCRIPTION: Places a purple 50x82 rectangle at position (0, 11).
; PLAN: r0=0(x), r1=11(y), r2=50(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 11
LDI r2, 50
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
