; DESCRIPTION: Places a cyan 30x63 rectangle at position (0, 122).
; PLAN: r0=0(x), r1=122(y), r2=30(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 122
LDI r2, 30
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
