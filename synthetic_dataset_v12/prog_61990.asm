; DESCRIPTION: Places a purple 76x54 rectangle at position (25, 164).
; PLAN: r0=25(x), r1=164(y), r2=76(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 164
LDI r2, 76
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
