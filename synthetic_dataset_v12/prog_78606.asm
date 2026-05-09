; DESCRIPTION: Places a blue 17x30 rectangle at position (43, 34).
; PLAN: r0=43(x), r1=34(y), r2=17(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 34
LDI r2, 17
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
