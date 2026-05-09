; DESCRIPTION: Renders a orange box of size 83x112 starting at (113, 12).
; PLAN: r0=113(x), r1=12(y), r2=83(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 12
LDI r2, 83
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
