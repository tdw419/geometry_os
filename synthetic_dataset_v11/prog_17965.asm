; DESCRIPTION: Renders a orange box of size 31x64 starting at (99, 176).
; PLAN: r0=99(x), r1=176(y), r2=31(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 176
LDI r2, 31
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
