; DESCRIPTION: Places a green 43x29 rectangle at position (384, 10).
; PLAN: r0=384(x), r1=10(y), r2=43(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 10
LDI r2, 43
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
