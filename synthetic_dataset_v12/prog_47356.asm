; DESCRIPTION: Places a cyan 19x32 rectangle at position (151, 167).
; PLAN: r0=151(x), r1=167(y), r2=19(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 167
LDI r2, 19
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
