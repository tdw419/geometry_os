; DESCRIPTION: Renders a orange box of size 95x111 starting at (55, 98).
; PLAN: r0=55(x), r1=98(y), r2=95(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 98
LDI r2, 95
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
