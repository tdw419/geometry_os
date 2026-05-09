; DESCRIPTION: Renders a orange box of size 10x47 starting at (113, 73).
; PLAN: r0=113(x), r1=73(y), r2=10(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 73
LDI r2, 10
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
