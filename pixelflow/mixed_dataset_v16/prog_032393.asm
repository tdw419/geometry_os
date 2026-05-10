; DESCRIPTION: Places a orange 24x102 rectangle at position (138, 64).
; PLAN: r0=138(x), r1=64(y), r2=24(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 64
LDI r2, 24
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
