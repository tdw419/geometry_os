; DESCRIPTION: Places a orange 11x24 rectangle at position (487, 116).
; PLAN: r0=487(x), r1=116(y), r2=11(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 116
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
