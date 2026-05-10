; DESCRIPTION: Creates a orange filled rectangle of size 42x94 starting at (151, 59).
; PLAN: r0=151(x), r1=59(y), r2=42(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 59
LDI r2, 42
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
