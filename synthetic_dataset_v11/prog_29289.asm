; DESCRIPTION: Renders a orange box of size 94x31 starting at (116, 140).
; PLAN: r0=116(x), r1=140(y), r2=94(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 140
LDI r2, 94
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
