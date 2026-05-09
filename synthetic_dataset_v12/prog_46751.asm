; DESCRIPTION: Places a cyan 42x26 rectangle at position (75, 172).
; PLAN: r0=75(x), r1=172(y), r2=42(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 172
LDI r2, 42
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
