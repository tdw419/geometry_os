; DESCRIPTION: Places a cyan 45x60 rectangle at position (54, 82).
; PLAN: r0=54(x), r1=82(y), r2=45(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 82
LDI r2, 45
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
