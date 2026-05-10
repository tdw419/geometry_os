; DESCRIPTION: Places a blue 37x100 rectangle at position (415, 128).
; PLAN: r0=415(x), r1=128(y), r2=37(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 128
LDI r2, 37
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
