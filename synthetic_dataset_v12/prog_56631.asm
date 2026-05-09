; DESCRIPTION: Places a black 108x61 rectangle at position (320, 49).
; PLAN: r0=320(x), r1=49(y), r2=108(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 49
LDI r2, 108
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
