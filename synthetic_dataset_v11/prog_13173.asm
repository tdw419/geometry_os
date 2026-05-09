; DESCRIPTION: Places a black 15x113 rectangle at position (23, 6).
; PLAN: r0=23(x), r1=6(y), r2=15(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 6
LDI r2, 15
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
