; DESCRIPTION: Places a cyan 115x37 rectangle at position (114, 219).
; PLAN: r0=114(x), r1=219(y), r2=115(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 219
LDI r2, 115
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
