; DESCRIPTION: Places a cyan 62x29 rectangle at position (87, 175).
; PLAN: r0=87(x), r1=175(y), r2=62(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 175
LDI r2, 62
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
