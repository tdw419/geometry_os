; DESCRIPTION: Places a black 85x105 rectangle at position (167, 80).
; PLAN: r0=167(x), r1=80(y), r2=85(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 80
LDI r2, 85
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
