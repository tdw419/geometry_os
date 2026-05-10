; DESCRIPTION: Places a purple 21x32 rectangle at position (159, 11).
; PLAN: r0=159(x), r1=11(y), r2=21(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 11
LDI r2, 21
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
