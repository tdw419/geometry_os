; DESCRIPTION: Places a purple 29x33 rectangle at position (164, 60).
; PLAN: r0=164(x), r1=60(y), r2=29(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 60
LDI r2, 29
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
