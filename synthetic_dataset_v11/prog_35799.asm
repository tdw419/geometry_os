; DESCRIPTION: Places a cyan 58x21 rectangle at position (42, 95).
; PLAN: r0=42(x), r1=95(y), r2=58(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 95
LDI r2, 58
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
