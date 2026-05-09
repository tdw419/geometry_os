; DESCRIPTION: Renders a orange box of size 29x21 starting at (135, 141).
; PLAN: r0=135(x), r1=141(y), r2=29(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 141
LDI r2, 29
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
