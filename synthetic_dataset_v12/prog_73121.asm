; DESCRIPTION: Places a orange 116x29 rectangle at position (372, 156).
; PLAN: r0=372(x), r1=156(y), r2=116(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 156
LDI r2, 116
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
