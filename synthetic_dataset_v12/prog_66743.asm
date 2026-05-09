; DESCRIPTION: Places a yellow 96x70 rectangle at position (384, 62).
; PLAN: r0=384(x), r1=62(y), r2=96(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 62
LDI r2, 96
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
