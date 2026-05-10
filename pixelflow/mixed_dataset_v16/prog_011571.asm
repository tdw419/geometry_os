; DESCRIPTION: Places a green 88x26 rectangle at position (180, 64).
; PLAN: r0=180(x), r1=64(y), r2=88(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 64
LDI r2, 88
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
