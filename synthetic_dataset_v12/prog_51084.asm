; DESCRIPTION: Places a blue 40x83 rectangle at position (320, 151).
; PLAN: r0=320(x), r1=151(y), r2=40(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 151
LDI r2, 40
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
