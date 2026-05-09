; DESCRIPTION: Places a red 29x108 rectangle at position (436, 44).
; PLAN: r0=436(x), r1=44(y), r2=29(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 44
LDI r2, 29
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
