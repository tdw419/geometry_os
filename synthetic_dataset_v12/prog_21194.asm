; DESCRIPTION: Places a white 62x71 rectangle at position (364, 36).
; PLAN: r0=364(x), r1=36(y), r2=62(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 36
LDI r2, 62
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
