; DESCRIPTION: Places a red 45x72 rectangle at position (32, 93).
; PLAN: r0=32(x), r1=93(y), r2=45(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 93
LDI r2, 45
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
