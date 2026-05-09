; DESCRIPTION: Places a green 40x23 rectangle at position (349, 88).
; PLAN: r0=349(x), r1=88(y), r2=40(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 88
LDI r2, 40
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
