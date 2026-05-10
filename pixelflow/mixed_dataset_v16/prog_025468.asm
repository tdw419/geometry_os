; DESCRIPTION: Creates a yellow filled rectangle of size 26x82 starting at (39, 112).
; PLAN: r0=39(x), r1=112(y), r2=26(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 112
LDI r2, 26
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
