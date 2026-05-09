; DESCRIPTION: Places a black 24x37 rectangle at position (360, 101).
; PLAN: r0=360(x), r1=101(y), r2=24(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 101
LDI r2, 24
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
