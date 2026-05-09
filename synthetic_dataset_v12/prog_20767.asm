; DESCRIPTION: Renders a orange box of size 20x109 starting at (59, 39).
; PLAN: r0=59(x), r1=39(y), r2=20(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 39
LDI r2, 20
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
