; DESCRIPTION: Creates a orange rectangular region at (156, 39) spanning 64 by 25 pixels.
; PLAN: r0=156(x), r1=39(y), r2=64(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 39
LDI r2, 64
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
