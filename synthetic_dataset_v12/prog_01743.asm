; DESCRIPTION: Places a red 101x55 rectangle at position (402, 11).
; PLAN: r0=402(x), r1=11(y), r2=101(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 11
LDI r2, 101
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
