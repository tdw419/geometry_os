; DESCRIPTION: Places a green 75x13 rectangle at position (291, 34).
; PLAN: r0=291(x), r1=34(y), r2=75(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 34
LDI r2, 75
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
