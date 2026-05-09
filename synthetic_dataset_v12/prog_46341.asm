; DESCRIPTION: Places a purple 76x115 rectangle at position (42, 48).
; PLAN: r0=42(x), r1=48(y), r2=76(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 48
LDI r2, 76
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
