; DESCRIPTION: Places a green 28x30 rectangle at position (160, 151).
; PLAN: r0=160(x), r1=151(y), r2=28(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 151
LDI r2, 28
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
