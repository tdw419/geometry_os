; DESCRIPTION: Places a orange 15x24 rectangle at position (34, 32).
; PLAN: r0=34(x), r1=32(y), r2=15(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 32
LDI r2, 15
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
