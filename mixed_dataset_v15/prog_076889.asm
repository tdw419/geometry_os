; DESCRIPTION: Places a blue 55x64 box at position (213, 151).
; PLAN: r0=213(x), r1=151(y), r2=55(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 151
LDI r2, 55
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
