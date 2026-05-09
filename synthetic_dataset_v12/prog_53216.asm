; DESCRIPTION: Places a white 100x101 rectangle at position (188, 5).
; PLAN: r0=188(x), r1=5(y), r2=100(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 5
LDI r2, 100
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
