; DESCRIPTION: Places a green 64x71 rectangle at position (137, 139).
; PLAN: r0=137(x), r1=139(y), r2=64(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 139
LDI r2, 64
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
