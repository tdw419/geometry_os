; DESCRIPTION: Places a orange 29x105 rectangle at position (145, 52).
; PLAN: r0=145(x), r1=52(y), r2=29(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 52
LDI r2, 29
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
