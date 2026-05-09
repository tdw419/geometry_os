; DESCRIPTION: Places a white 83x18 rectangle at position (359, 219).
; PLAN: r0=359(x), r1=219(y), r2=83(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 219
LDI r2, 83
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
