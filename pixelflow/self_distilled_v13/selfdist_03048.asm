; DESCRIPTION: Creates a orange filled rectangle of size 74x42 starting at (143, 51).
; PLAN: r0=143(x), r1=51(y), r2=74(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 51
LDI r2, 74
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
