; DESCRIPTION: Places a cyan 11x14 rectangle at position (12, 1).
; PLAN: r0=12(x), r1=1(y), r2=11(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 1
LDI r2, 11
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
