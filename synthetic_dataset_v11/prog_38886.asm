; DESCRIPTION: Places a cyan 76x17 rectangle at position (7, 74).
; PLAN: r0=7(x), r1=74(y), r2=76(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 74
LDI r2, 76
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
