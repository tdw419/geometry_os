; DESCRIPTION: Places a red 29x118 rectangle at position (402, 10).
; PLAN: r0=402(x), r1=10(y), r2=29(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 10
LDI r2, 29
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
