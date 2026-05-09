; DESCRIPTION: Places a cyan 35x85 rectangle at position (86, 165).
; PLAN: r0=86(x), r1=165(y), r2=35(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 165
LDI r2, 35
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
