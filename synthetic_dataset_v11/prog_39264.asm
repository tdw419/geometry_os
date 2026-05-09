; DESCRIPTION: Renders a orange box of size 47x61 starting at (114, 71).
; PLAN: r0=114(x), r1=71(y), r2=47(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 71
LDI r2, 47
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
