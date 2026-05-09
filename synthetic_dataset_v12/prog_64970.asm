; DESCRIPTION: Places a blue 72x62 rectangle at position (384, 18).
; PLAN: r0=384(x), r1=18(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 18
LDI r2, 72
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
