; DESCRIPTION: Places a orange 56x116 rectangle at position (119, 72).
; PLAN: r0=119(x), r1=72(y), r2=56(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 72
LDI r2, 56
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
