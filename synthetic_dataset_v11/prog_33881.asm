; DESCRIPTION: Places a orange 42x51 rectangle at position (167, 62).
; PLAN: r0=167(x), r1=62(y), r2=42(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 62
LDI r2, 42
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
