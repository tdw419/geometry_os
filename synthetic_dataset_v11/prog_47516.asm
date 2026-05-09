; DESCRIPTION: Places a cyan 42x91 rectangle at position (19, 60).
; PLAN: r0=19(x), r1=60(y), r2=42(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 60
LDI r2, 42
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
