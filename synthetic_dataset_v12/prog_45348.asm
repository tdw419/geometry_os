; DESCRIPTION: Places a orange 10x106 rectangle at position (426, 28).
; PLAN: r0=426(x), r1=28(y), r2=10(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 28
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
