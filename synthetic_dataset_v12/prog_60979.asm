; DESCRIPTION: Places a blue 42x76 rectangle at position (39, 109).
; PLAN: r0=39(x), r1=109(y), r2=42(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 42
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
