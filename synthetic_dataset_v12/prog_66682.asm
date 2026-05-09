; DESCRIPTION: Places a red 87x21 rectangle at position (101, 74).
; PLAN: r0=101(x), r1=74(y), r2=87(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 74
LDI r2, 87
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
