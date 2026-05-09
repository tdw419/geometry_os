; DESCRIPTION: Places a purple 24x103 rectangle at position (40, 39).
; PLAN: r0=40(x), r1=39(y), r2=24(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 39
LDI r2, 24
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
