; DESCRIPTION: Places a green 33x88 rectangle at position (5, 106).
; PLAN: r0=5(x), r1=106(y), r2=33(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 106
LDI r2, 33
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
