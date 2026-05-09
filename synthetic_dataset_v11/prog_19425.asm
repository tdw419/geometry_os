; DESCRIPTION: Places a cyan 111x81 rectangle at position (134, 158).
; PLAN: r0=134(x), r1=158(y), r2=111(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 158
LDI r2, 111
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
