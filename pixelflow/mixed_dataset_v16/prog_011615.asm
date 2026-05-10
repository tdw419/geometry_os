; DESCRIPTION: Places a green 76x22 rectangle at position (116, 219).
; PLAN: r0=116(x), r1=219(y), r2=76(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 219
LDI r2, 76
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
