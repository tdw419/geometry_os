; DESCRIPTION: Places a black 76x83 rectangle at position (180, 59).
; PLAN: r0=180(x), r1=59(y), r2=76(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 59
LDI r2, 76
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
