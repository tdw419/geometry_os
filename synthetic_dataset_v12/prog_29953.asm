; DESCRIPTION: Places a cyan 49x30 rectangle at position (122, 175).
; PLAN: r0=122(x), r1=175(y), r2=49(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 175
LDI r2, 49
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
