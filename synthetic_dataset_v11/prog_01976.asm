; DESCRIPTION: Places a cyan 19x107 rectangle at position (105, 72).
; PLAN: r0=105(x), r1=72(y), r2=19(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 72
LDI r2, 19
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
