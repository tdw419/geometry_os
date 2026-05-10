; DESCRIPTION: Places a orange 116x63 rectangle at position (194, 28).
; PLAN: r0=194(x), r1=28(y), r2=116(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 28
LDI r2, 116
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
