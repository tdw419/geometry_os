; DESCRIPTION: Places a cyan 119x83 rectangle at position (86, 134).
; PLAN: r0=86(x), r1=134(y), r2=119(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 134
LDI r2, 119
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
