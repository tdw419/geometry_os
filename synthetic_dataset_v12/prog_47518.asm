; DESCRIPTION: Places a blue 36x55 rectangle at position (397, 21).
; PLAN: r0=397(x), r1=21(y), r2=36(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 21
LDI r2, 36
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
