; DESCRIPTION: Creates a orange filled rectangle of size 80x34 starting at (304, 156).
; PLAN: r0=304(x), r1=156(y), r2=80(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 156
LDI r2, 80
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
