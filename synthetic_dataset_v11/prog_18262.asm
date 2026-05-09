; DESCRIPTION: Places a green 81x107 rectangle at position (167, 115).
; PLAN: r0=167(x), r1=115(y), r2=81(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 115
LDI r2, 81
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
