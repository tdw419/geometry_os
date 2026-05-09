; DESCRIPTION: Places a yellow 86x88 rectangle at position (318, 5).
; PLAN: r0=318(x), r1=5(y), r2=86(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 5
LDI r2, 86
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
