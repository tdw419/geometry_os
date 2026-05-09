; DESCRIPTION: Places a orange 42x71 rectangle at position (463, 167).
; PLAN: r0=463(x), r1=167(y), r2=42(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 167
LDI r2, 42
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
