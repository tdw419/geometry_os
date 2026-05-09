; DESCRIPTION: Places a cyan 32x36 rectangle at position (155, 83).
; PLAN: r0=155(x), r1=83(y), r2=32(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 83
LDI r2, 32
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
