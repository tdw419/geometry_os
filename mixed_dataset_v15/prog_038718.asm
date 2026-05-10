; DESCRIPTION: Creates a orange filled rectangle of size 47x57 starting at (343, 143).
; PLAN: r0=343(x), r1=143(y), r2=47(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 143
LDI r2, 47
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
