; DESCRIPTION: Places a magenta 16x14 rectangle at position (475, 19).
; PLAN: r0=475(x), r1=19(y), r2=16(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 19
LDI r2, 16
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
