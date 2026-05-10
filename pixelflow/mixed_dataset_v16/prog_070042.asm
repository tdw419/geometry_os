; DESCRIPTION: Places a orange 56x101 rectangle at position (394, 73).
; PLAN: r0=394(x), r1=73(y), r2=56(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 73
LDI r2, 56
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
