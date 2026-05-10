; DESCRIPTION: Places a black 106x56 rectangle at position (318, 191).
; PLAN: r0=318(x), r1=191(y), r2=106(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 191
LDI r2, 106
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
