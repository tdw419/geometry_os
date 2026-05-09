; DESCRIPTION: Renders a orange box of size 115x102 starting at (330, 19).
; PLAN: r0=330(x), r1=19(y), r2=115(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 19
LDI r2, 115
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
