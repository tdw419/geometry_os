; DESCRIPTION: Places a red 84x71 rectangle at position (354, 49).
; PLAN: r0=354(x), r1=49(y), r2=84(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 49
LDI r2, 84
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
