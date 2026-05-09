; DESCRIPTION: Places a blue 47x95 rectangle at position (42, 131).
; PLAN: r0=42(x), r1=131(y), r2=47(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 131
LDI r2, 47
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
