; DESCRIPTION: Renders a orange box of size 20x59 starting at (310, 174).
; PLAN: r0=310(x), r1=174(y), r2=20(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 174
LDI r2, 20
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
