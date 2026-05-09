; DESCRIPTION: Renders a orange box of size 61x67 starting at (39, 147).
; PLAN: r0=39(x), r1=147(y), r2=61(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 147
LDI r2, 61
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
