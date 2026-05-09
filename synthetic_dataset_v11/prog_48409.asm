; DESCRIPTION: Places a black 74x22 rectangle at position (150, 0).
; PLAN: r0=150(x), r1=0(y), r2=74(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 0
LDI r2, 74
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
