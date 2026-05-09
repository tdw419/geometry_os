; DESCRIPTION: Places a blue 76x69 rectangle at position (77, 27).
; PLAN: r0=77(x), r1=27(y), r2=76(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 27
LDI r2, 76
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
