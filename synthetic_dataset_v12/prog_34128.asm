; DESCRIPTION: Places a blue 34x34 rectangle at position (18, 218).
; PLAN: r0=18(x), r1=218(y), r2=34(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 218
LDI r2, 34
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
