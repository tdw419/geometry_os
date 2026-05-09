; DESCRIPTION: Places a cyan 74x63 rectangle at position (7, 30).
; PLAN: r0=7(x), r1=30(y), r2=74(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 30
LDI r2, 74
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
