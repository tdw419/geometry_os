; DESCRIPTION: Places a orange 19x42 rectangle at position (36, 167).
; PLAN: r0=36(x), r1=167(y), r2=19(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 167
LDI r2, 19
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
