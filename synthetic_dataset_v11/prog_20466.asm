; DESCRIPTION: Places a black 103x103 rectangle at position (88, 5).
; PLAN: r0=88(x), r1=5(y), r2=103(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 5
LDI r2, 103
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
