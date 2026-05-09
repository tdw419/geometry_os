; DESCRIPTION: Renders a orange box of size 83x95 starting at (130, 113).
; PLAN: r0=130(x), r1=113(y), r2=83(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 113
LDI r2, 83
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
