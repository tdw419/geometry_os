; DESCRIPTION: Places a cyan 17x88 rectangle at position (158, 34).
; PLAN: r0=158(x), r1=34(y), r2=17(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 34
LDI r2, 17
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
