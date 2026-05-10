; DESCRIPTION: Places a yellow 88x69 box at position (326, 128).
; PLAN: r0=326(x), r1=128(y), r2=88(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 128
LDI r2, 88
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
