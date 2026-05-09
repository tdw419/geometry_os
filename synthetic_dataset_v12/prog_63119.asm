; DESCRIPTION: Places a cyan 59x88 rectangle at position (135, 122).
; PLAN: r0=135(x), r1=122(y), r2=59(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 122
LDI r2, 59
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
