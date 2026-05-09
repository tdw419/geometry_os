; DESCRIPTION: Renders a orange box of size 90x40 starting at (163, 82).
; PLAN: r0=163(x), r1=82(y), r2=90(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 82
LDI r2, 90
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
