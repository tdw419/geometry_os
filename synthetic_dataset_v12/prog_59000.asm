; DESCRIPTION: Places a cyan 10x76 rectangle at position (63, 61).
; PLAN: r0=63(x), r1=61(y), r2=10(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 61
LDI r2, 10
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
