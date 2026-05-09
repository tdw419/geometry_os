; DESCRIPTION: Renders a orange box of size 69x64 starting at (335, 96).
; PLAN: r0=335(x), r1=96(y), r2=69(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 96
LDI r2, 69
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
