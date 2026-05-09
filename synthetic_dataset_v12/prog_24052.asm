; DESCRIPTION: Places a yellow 11x79 rectangle at position (381, 165).
; PLAN: r0=381(x), r1=165(y), r2=11(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 165
LDI r2, 11
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
