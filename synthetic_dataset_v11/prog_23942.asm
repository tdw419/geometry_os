; DESCRIPTION: Renders a orange box of size 54x102 starting at (181, 27).
; PLAN: r0=181(x), r1=27(y), r2=54(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 27
LDI r2, 54
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
