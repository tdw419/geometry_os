; DESCRIPTION: Places a blue 116x45 rectangle at position (167, 9).
; PLAN: r0=167(x), r1=9(y), r2=116(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 9
LDI r2, 116
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
