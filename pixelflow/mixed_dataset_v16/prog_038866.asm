; DESCRIPTION: Places a red 32x60 rectangle at position (327, 69).
; PLAN: r0=327(x), r1=69(y), r2=32(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 69
LDI r2, 32
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
