; DESCRIPTION: Places a black 16x23 rectangle at position (473, 1).
; PLAN: r0=473(x), r1=1(y), r2=16(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 1
LDI r2, 16
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
