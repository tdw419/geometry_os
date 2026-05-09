; DESCRIPTION: Places a orange 66x100 rectangle at position (29, 27).
; PLAN: r0=29(x), r1=27(y), r2=66(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 27
LDI r2, 66
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
