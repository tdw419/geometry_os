; DESCRIPTION: Places a orange 99x72 rectangle at position (119, 71).
; PLAN: r0=119(x), r1=71(y), r2=99(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 71
LDI r2, 99
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
