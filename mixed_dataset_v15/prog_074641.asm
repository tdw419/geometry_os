; DESCRIPTION: Creates a orange filled rectangle of size 111x86 starting at (156, 21).
; PLAN: r0=156(x), r1=21(y), r2=111(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 111
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
