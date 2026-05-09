; DESCRIPTION: Renders a orange box of size 20x95 starting at (482, 155).
; PLAN: r0=482(x), r1=155(y), r2=20(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 155
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
