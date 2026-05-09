; DESCRIPTION: Places a cyan 20x63 rectangle at position (134, 30).
; PLAN: r0=134(x), r1=30(y), r2=20(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 30
LDI r2, 20
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
