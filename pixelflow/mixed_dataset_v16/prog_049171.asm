; DESCRIPTION: Places a cyan 107x101 rectangle at position (159, 49).
; PLAN: r0=159(x), r1=49(y), r2=107(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 49
LDI r2, 107
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
