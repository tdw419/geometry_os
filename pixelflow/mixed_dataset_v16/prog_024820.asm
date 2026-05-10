; DESCRIPTION: Places a red 43x110 rectangle at position (220, 88).
; PLAN: r0=220(x), r1=88(y), r2=43(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 88
LDI r2, 43
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
