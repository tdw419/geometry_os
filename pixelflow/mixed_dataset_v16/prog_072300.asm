; DESCRIPTION: Places a black 43x71 rectangle at position (305, 43).
; PLAN: r0=305(x), r1=43(y), r2=43(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 43
LDI r2, 43
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
