; DESCRIPTION: Creates a orange filled rectangle of size 88x57 starting at (358, 17).
; PLAN: r0=358(x), r1=17(y), r2=88(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 17
LDI r2, 88
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
