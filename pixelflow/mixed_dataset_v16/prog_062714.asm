; DESCRIPTION: Renders a orange box of size 61x108 starting at (247, 71).
; PLAN: r0=247(x), r1=71(y), r2=61(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 71
LDI r2, 61
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
