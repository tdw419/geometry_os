; DESCRIPTION: Places a black 105x120 rectangle at position (9, 21).
; PLAN: r0=9(x), r1=21(y), r2=105(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 21
LDI r2, 105
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
