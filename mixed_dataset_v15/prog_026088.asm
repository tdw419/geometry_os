; DESCRIPTION: Places a red 75x88 rectangle at position (204, 84).
; PLAN: r0=204(x), r1=84(y), r2=75(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 84
LDI r2, 75
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
