; DESCRIPTION: Places a cyan 42x66 rectangle at position (71, 8).
; PLAN: r0=71(x), r1=8(y), r2=42(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 8
LDI r2, 42
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
