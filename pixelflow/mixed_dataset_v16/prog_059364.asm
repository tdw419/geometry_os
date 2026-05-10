; DESCRIPTION: Places a cyan 50x53 rectangle at position (15, 42).
; PLAN: r0=15(x), r1=42(y), r2=50(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 42
LDI r2, 50
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
