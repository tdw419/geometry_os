; DESCRIPTION: Places a white 10x35 rectangle at position (23, 101).
; PLAN: r0=23(x), r1=101(y), r2=10(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 101
LDI r2, 10
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
