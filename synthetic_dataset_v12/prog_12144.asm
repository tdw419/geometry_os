; DESCRIPTION: Places a orange 22x119 rectangle at position (64, 36).
; PLAN: r0=64(x), r1=36(y), r2=22(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 36
LDI r2, 22
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
