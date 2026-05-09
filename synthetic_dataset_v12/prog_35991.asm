; DESCRIPTION: Places a white 55x101 rectangle at position (236, 88).
; PLAN: r0=236(x), r1=88(y), r2=55(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 88
LDI r2, 55
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
