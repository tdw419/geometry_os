; DESCRIPTION: Places a orange 10x55 rectangle at position (324, 56).
; PLAN: r0=324(x), r1=56(y), r2=10(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 56
LDI r2, 10
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
