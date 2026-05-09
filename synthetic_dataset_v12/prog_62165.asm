; DESCRIPTION: Places a blue 18x62 rectangle at position (6, 27).
; PLAN: r0=6(x), r1=27(y), r2=18(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 27
LDI r2, 18
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
