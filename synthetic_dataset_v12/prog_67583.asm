; DESCRIPTION: Renders a orange box of size 88x61 starting at (92, 165).
; PLAN: r0=92(x), r1=165(y), r2=88(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 165
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
