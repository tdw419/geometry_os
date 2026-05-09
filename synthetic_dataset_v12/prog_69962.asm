; DESCRIPTION: Places a black 62x71 rectangle at position (320, 102).
; PLAN: r0=320(x), r1=102(y), r2=62(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 102
LDI r2, 62
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
