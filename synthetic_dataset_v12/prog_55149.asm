; DESCRIPTION: Places a cyan 45x15 rectangle at position (118, 103).
; PLAN: r0=118(x), r1=103(y), r2=45(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 103
LDI r2, 45
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
