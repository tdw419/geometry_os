; DESCRIPTION: Places a orange 62x111 rectangle at position (128, 24).
; PLAN: r0=128(x), r1=24(y), r2=62(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 24
LDI r2, 62
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
