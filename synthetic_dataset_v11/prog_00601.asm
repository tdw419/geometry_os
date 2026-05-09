; DESCRIPTION: Places a blue 64x38 rectangle at position (192, 153).
; PLAN: r0=192(x), r1=153(y), r2=64(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 153
LDI r2, 64
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
