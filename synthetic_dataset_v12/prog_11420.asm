; DESCRIPTION: Places a black 59x71 rectangle at position (175, 183).
; PLAN: r0=175(x), r1=183(y), r2=59(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 183
LDI r2, 59
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
