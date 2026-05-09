; DESCRIPTION: Renders a orange box of size 18x39 starting at (302, 113).
; PLAN: r0=302(x), r1=113(y), r2=18(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 113
LDI r2, 18
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
