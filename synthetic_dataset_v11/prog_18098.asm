; DESCRIPTION: Places a blue 69x56 rectangle at position (96, 192).
; PLAN: r0=96(x), r1=192(y), r2=69(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 192
LDI r2, 69
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
