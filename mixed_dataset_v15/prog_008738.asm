; DESCRIPTION: Places a orange 68x101 rectangle at position (340, 0).
; PLAN: r0=340(x), r1=0(y), r2=68(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 0
LDI r2, 68
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
