; DESCRIPTION: Renders a orange box of size 102x39 starting at (297, 77).
; PLAN: r0=297(x), r1=77(y), r2=102(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 77
LDI r2, 102
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
