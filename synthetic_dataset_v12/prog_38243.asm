; DESCRIPTION: Places a orange 100x21 rectangle at position (143, 0).
; PLAN: r0=143(x), r1=0(y), r2=100(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 100
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
