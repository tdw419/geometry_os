; DESCRIPTION: Places a black 56x65 rectangle at position (278, 15).
; PLAN: r0=278(x), r1=15(y), r2=56(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 15
LDI r2, 56
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
