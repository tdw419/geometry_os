; DESCRIPTION: Places a cyan 23x81 rectangle at position (183, 23).
; PLAN: r0=183(x), r1=23(y), r2=23(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 23
LDI r2, 23
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
