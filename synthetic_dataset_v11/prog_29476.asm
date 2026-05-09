; DESCRIPTION: Places a orange 99x48 rectangle at position (24, 87).
; PLAN: r0=24(x), r1=87(y), r2=99(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 87
LDI r2, 99
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
