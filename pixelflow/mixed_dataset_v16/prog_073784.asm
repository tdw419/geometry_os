; DESCRIPTION: Places a white 83x57 rectangle at position (155, 36).
; PLAN: r0=155(x), r1=36(y), r2=83(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 36
LDI r2, 83
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
